function [this, handles] = constructor(varargin)
% cParent::constructor: 
%
% function this = constructor(varargin)
%
% Chapter 23, Object-Oriented MATLAB
%
% Private Member Variables
%    m_parent_func_array: Holds the function handles for parent classes
%    m_protected_var: Example protected variable.
%
%
%
% Author Info
% Andy Register, Ph.D.
% (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 18-Sep-2006 12:09:35
%

class_name = mfilename('class');

persistent default_this
if isempty(default_this)
    [default_struct, superior, inferior, parents] = ctor_ini;  % call /private/ctor_ini.m
    default_this = class(default_struct, class_name, parents{:});

    if ~isempty(superior)
        superiorto(superior{:});
    end
    if ~isempty(inferior)
        inferiorto(inferior{:});
    end
end
this = default_this;
if nargin > 0  % if default nothing else to do otherwise pass varargin to helper
    try
        this = feval(sprintf('ctor_%d', nargin), this, varargin{:});
    catch
        err = lasterror;
        switch err.identifier
            case 'MATLAB:UndefinedFunction'
                err.message = [['class ' class_name ' cannot be constructed from '] ...
                    [sprintf('%d', nargin) ' input argument(s) ']];
        end
        rethrow(err);
    end
end 

if nargout == 2
    stack = dbstack('-completenames');
    caller = stack(end-1);
    [call_path, call_name] = fileparts(caller.file);
    [dc, private_name] = fileparts(call_path);
    if strcmp(call_name, 'ctor_ini') && strcmp(private_name, 'private')
        % omit pget and pset handles for any parents
        handle_str = cellfun(@func2str, this.m_protected_func_array, 'UniformOutput', false);
        omit = [strmatch('pget', handle_str, 'exact') ...
            strmatch('pset', handle_str, 'exact')];
        include = setdiff(1:numel(handle_str), omit);
        % include pget and pset for this class
        handles = {@pget; @pset; this.m_protected_func_array{include}};
    else
        handles = {};
    end
end
