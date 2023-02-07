function varargout = subsref(this, index)
% cShapeArray::subsref: 
%
% function varargout = subsref(this, index)
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
    if isempty(this)
        varargout = cell(0);
    else
        varargout = cell(1, max(numel(this.mArray), nargout));
    end
    try
        [varargout{:}] = get(this, index);
    catch
        rethrow(lasterror);
    end

    case '()'
        this_subset = feval(class(this));  % create a new container object
        this_subset.mArray = this.mArray(index(1).subs{:}); % fill new container with subset data
        if length(index) == 1
            varargout = {this_subset};
        else
            % trick subsref into returning more than 1 ans
            varargout = cell(size(this_subset));
            [varargout{:}] = subsref(this_subset, index(2:end));
            if do_assignin
                % magically the value of this_subset has changed 
                this(index(1).subs{:}) = this_subset;
            end
        end

    case '{}'
      error('OOP:unsupportedOption', ...
            ['??? ' class(this) ' object, is not a cell array']);

    otherwise
        error('OOP:unexpectedIndex', ...
             ['??? Unexpected index.type of ' index(1).type]);
end

if do_assignin % subsref used in special way, see book section 3
    var_name = inputname(1);
    if isempty(var_name)
        warning('OOP:invalidInputname', ...
            'No assignment: subsref with assignment can only be used on non-indexed objects');
    else
        assignin('caller', var_name, this);
        caller = evalin('caller', 'mfilename');
        if ~isempty(strmatch(caller, {'subsref' 'subsasgn' 'get' 'set'}))
            assignin('caller', 'do_assignin', true);
        end
    end
end

if length(varargout) > 1 && nargout <= 1
    if iscellstr(varargout) || any(cellfun('isempty', varargout))
        varargout = {varargout};
    else
        try
            varargout = {[varargout{:}]};
        catch
            varargout = {varargout};
        end
    end
end
