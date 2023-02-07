function this = subsasgn(this, index, varargin)
% cShapeArray::subsasgn: 
%
% function this = subsasgn(this, index, varargin)
%
% Chapter 19
%
%
%
%
% Chapter 19
% Copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 10-Feb-2006 09:59:40
%

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
                error('Container:UnexpectedInputSize', ...
                  'Only one input is allowed for () assignment.');
            
            elseif isempty(varargin{1})
                % empty input, delete elements, use builtin subsasgn
                this.mArray = subsasgn(this.mArray, index, varargin{end:-1:1});

            elseif strcmp(class(varargin{1}), mfilename('class'))
                % another container of the same type
                error('Container:UnsupportedAssignment', ...
                    'Container to container assignment is not supported.');
                
            elseif iscell(varargin{1})
                % a cell array of objects
                error('Container:UnsupportedAssignment', ...
                    'The assignment of cells into a container is not supported.');
                
            elseif isa(varargin{1}, this.mType)
                % an object that can indeed be held by the container
                % might have a length > 1
                set_val = num2cell(varargin{1});
                this.mArray = subsasgn(this.mArray, index, set_val);
                is_empty = cellfun('isempty', this.mArray);
                if any(is_empty)
                    this.mArray(is_empty) = {feval(this.mType)};
                end
            else
                % any other condition is an error
                error('Container:UnsupportedAssignment', ...
                    ['The container cannot hold objects of type ' class(varargin{1})]);
            end
            
        else
            % create a new container object
            this_subset = feval(class(this));  % create a new container object
            this_subset.mArray = this.mArray(index(1).subs{:}); % fill new container with subset data
            this_subset = subsasgn(this_subset, index(2:end), varargin{:});  % call subsasgn on the new container
            this.mArray(index(1).subs{:}) = this_subset.mArray; % put subset back
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

