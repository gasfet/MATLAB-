function public_struct = struct(this)
% cPolyFun::struct: 
%
% function public_struct = struct(this)
%
%
% Public Member Variables
%    coef: length-N matrix of doubles: Used to hold polynomial coefficients for
%        the expression, a(1) + a(2)*x^2 + a(3)*x^3 + ...
%
%
% returns the list of public member variable names
% Author Info
% Andy Register, Ph.D.
% (c) 2006 Andy Register
% Object-Oriented Programming in MATLAB, Chapter 22
% A class_wizard v.3 assembled file, generated: 13-Sep-2006 16:21:39
%

names = fieldnames(this);  % tailored version returns public names
values = cell(length(names), length(this(:)));  % preallocate
for k = 1:length(names)
    [values{k, :}] = subsref(this, struct('type', '.', 'subs', names{k}));
end
public_struct = reshape(cell2struct(values, names, 1), size(this));
