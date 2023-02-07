function this = subsasgn(this, index, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 16 example cShape::subsasgn
%   (c) 2006 Andy Register

do_assignin = false; % special variable, see book section 3

switch index(1).type
    
    case '.'
        try
            this = set(this, index, varargin{end:-1:1});
        catch
            rethrow(lasterror);
        end
        
    case '()'
        if isempty(this)
            % due to superiorto, need to look at this and varargin
            if isa(this, mfilename('class'))
                this = eval(class(this));
            else
                this = eval(class(varargin{1}));
            end
        end
        if length(index) == 1
            if length(varargin) > 1
                error('OOP:UnexpectedInputSize', ...
                    ['Only one input is allowed for () assignment.']);
            end
            if isempty(varargin{1}) || strcmp(class(varargin{1}), mfilename('class'))
                this = builtin('subsasgn', this, index, varargin{end:-1:1});
            else
                error('OOP:UnexpectedType', ...
                    ['Conversion to ' mfilename('class') ' from ' ...
                    class(mismatched{1}) ' is not possible.']);
            end
        else
            this_subset = this(index(1).subs{:});  % get the subset
            this_subset = subsasgn(this_subset, index(2:end), varargin{:});
            this(index(1).subs{:}) = this_subset; % put subset back
        end
        
    case '{}'
      error('OOP:unsupportedOption', ...
            ['??? ' class(this) ' object, is not a cell array']);

    otherwise
        error('OOP:unexpectedIndex', ...
             ['??? Unexpected index.type of ' index(1).type]);
end

if do_assignin % set used in special way, see book section 3
    var_name = inputname(1);
    if isempty(var_name)
        warning('OOP:invalidInputname', ...
                'No assignment: set with assignment can only be used on non-indexed objects');
    else
        assignin('caller', var_name, this);
        caller = evalin('caller', 'mfilename');
        if ~isempty(strmatch(caller, {'subsref' 'subsasgn' 'get' 'set'}))
            assignin('caller', 'do_assignin', true);
        end
    end
end
