function out_val = call_parent_protected(this, in_val)
% cChild::call_parent_protected: 
%
% function varargout = call_parent_protected(this, varargin)
%
% Chapter 23, Object-Oriented MATLAB
%
% Author Info
% Andy Register, Ph.D.
% (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 18-Sep-2006 17:22:14
%

handle_str = cellfun(@func2str, this.m_protected_func_array, ...
    'UniformOutput', false);
handle_index = strmatch('protected_function', handle_str, 'exact');

if isempty(handle_index)
    error('Protected:UndefinedFunction', ...
        ['Undefined protected command/function ' handle_str{handle_index}]);
else
    out_val = feval(this.m_protected_func_array{handle_index(1)}, in_val);
end
