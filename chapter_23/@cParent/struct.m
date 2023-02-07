function public_struct = struct(this)
% cParent::struct: 
%
% function public_struct = struct(this)
%
% Chapter 23, Object-Oriented MATLAB
%
%
%
%
% returns the list of public member variable names
% Author Info
% Andy Register, Ph.D.
% (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 18-Sep-2006 17:23:58
%

names = fieldnames(this);  % tailored version returns public names
values = cell(length(names), length(this(:)));  % preallocate
for k = 1:length(names)
    [values{k, :}] = subsref(this, struct('type', '.', 'subs', names{k}));
end
public_struct = reshape(cell2struct(values, names, 1), size(this));
