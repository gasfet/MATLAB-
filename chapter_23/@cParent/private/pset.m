function this = pset(this, index, varargin)
% cParent::pset: Function similar to set except for protected varia...
%
% function this = pset(this, index, set_value)
%
% Description:
%     Function similar to set except for protected variables
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
% set_value: no type info: no description provided
%
% Output Arguments::
%
% this: no type info: no description provided
%
% Author Info
% Andy Register, Ph.D.
% (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 18-Sep-2006 11:58:58
%

do_assignin = false;  % special variable, see book section 3
called_by_name = ischar(index);

% the set switch below needs a substruct
if called_by_name
    index = struct('type', '.', 'subs', index);
end

% protected-member-variable section
found = true;  % otherwise-case will flip to false
switch index(1).subs
    case 'protected_var'
        if length(index) > 1
            this.m_protected_var = ...
                subsasgn(this.m_protected_var, index(2:end), varargin{:});
        else
            [this.m_protected_var] = deal(varargin{:});
        end
    otherwise
        found = false;
end

% parent forwarding block
if ~found
    % get the indices of all parent pget functions they should be in the
    % same order as parents in parent list.
    handle_str = cellfun(@func2str, this(1).m_protected_func_array, 'UniformOutput', false);
    pset_idx = strmatch('pset', handle_str, 'exact');
    
    parent_name = parent_list';
    for pk = 1:numel(parent_name)
        try
            parent = [this.(parent_name{pk})];
            parent_pset_idx = pset_idx(pk);
            pset_func = this(1).m_protected_func_array{parent_pset_idx};
            parent = feval(pset_func, parent, index, varargin{:});
            parent = num2cell(parent);
            [this.(parent_name{pk})] = deal(parent{:});
            found = true;  % catch will assign false if not found
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
end

if ~found
    error('MATLAB:nonExistentField', ...
        'Reference to non-existent field identifier %s', ...
        index(1).subs);
end

varargout{1} = this;
