function public_struct = struct(this)
% cBizzare::struct: 
%
% function public_struct = struct(this)
%
%
% Public Member Variables
%    show_arg: operator member function: Does a full display of arguments
%        passed through to the function
%
%
% returns the list of public member variable names
% Author Info
% Andy Register
% (c) 2006 Andy Register
% Chapter 22 Object-Oriented Programming in MATLAB
% A class_wizard v.3 assembled file, generated: 10-Sep-2006 13:57:36
%

names = fieldnames(this);  % tailored version returns public names
values = cell(length(names), length(this(:)));  % preallocate
for k = 1:length(names)
    [values{k, :}] = subsref(this, struct('type', '.', 'subs', names{k}));
end
public_struct = reshape(cell2struct(values, names, 1), size(this));
