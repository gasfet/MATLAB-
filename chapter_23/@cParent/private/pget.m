function varargout = pget(this, index, varargin)
% cParent::pget: Function similar to get except for protected varia...
%
% function varargout = pget(this, index)
%
% Description:
%     Function similar to get except for protected variables
%
% Member function of the class cParent
%     Chapter 23, Object-Oriented MATLAB
%
% Input Arguments::
%
% this: no type info: no description provided
%
% index: no type info: no description provided
%
% Output Arguments::
%
% varargout: no type info: no description provided
%
% Author Info
% Andy Register, Ph.D.
% (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 18-Sep-2006 11:58:58
%

do_sub_indexing = true;  % helper might do all sub indexing
do_assignin = false;  % special variable, see book section 3

called_by_name = ischar(index);

% the set switch below needs a substruct
if called_by_name
    index = struct('type', '.', 'subs', index);
end

% public-member-variable section
found = true;  % otherwise-case will flip to false
switch index(1).subs
    case 'protected_var'
        if isempty(this)
            varargout = {};
        else
            varargout = {this.m_protected_var};
        end
    otherwise
        found = false;  % didn't find it in the public section
end

% parent forwarding block
if ~found
    if nargout == 0
        varargout = cell(size(this));
    else
        varargout = cell(1, nargout);
    end
    
    % get the indices of all parent pget functions they should be in the
    % same order as parents in parent list.
    handle_str = cellfun(@func2str, this(1).m_protected_func_array, 'UniformOutput', false);
    pget_idx = strmatch('pget', handle_str, 'exact');
    
    parent_name = parent_list';
    for pk = 1:numel(parent_name)
        try
            parent = [this.(parent_name{pk})];
            parent_pget_idx = pget_idx(pk);
            pget_func = this(1).m_protected_func_array{parent_pget_idx};
            [varargout{:}] = feval(pget_func, parent, index);
            found = true;  % catch will assign false if not found
            do_sub_indexing = false;  % assume parent did all sub-indexing
            break;  % can only get here if field is found
        catch
            found = false;
            err = lasterror;
            switch err.identifier
                case 'MATLAB:nonExistentField'
                    % NOP
                otherwise
                    rethrow(err);
            end
        end
    end
    if do_assignin
        parent = num2cell(parent);
        [this.(parent_name{1})] = deal(parent{:});
    end
end

% error checking
if ~found
    error('MATLAB:nonExistentField', ...
        'Reference to non-existent field identifier %s', ...
        index(1).subs);
end

% nargout repackaging
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

% special syntax block
if do_assignin % get being used in special way, see book section 3
    var_name = inputname(1);
    if isempty(var_name)
        warning('OOP:invalidInputname', ...
                'No assignment: pass-by-reference can only be used on non-indexed objects');
    else
        assignin('caller', var_name, this);
        caller = evalin('caller', 'mfilename');
        if ~isempty(strmatch(caller, {'subsref' 'subsasgn' 'get' 'set'}))
            assignin('caller', 'do_assignin', true);
        end
    end
end

% deep indexing block
if do_sub_indexing
    index = [index(2:end) varargin{:}];
    if length(index) > 0
        if length(this(:)) == 1
            varargout = {subsref([varargout{:}], index)};
        else
            [err_id, err_msg] = array_reference_error(index(1).type);
            error(err_id, err_msg);
        end
    end
end

