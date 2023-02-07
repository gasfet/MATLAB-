function public_struct = struct(this)
% cShapeArray::struct: 
%
% function public_struct = struct(this)
%
% Chapter 19
%
%
%
%
% returns the list of public member variable names
% Author Info
% Copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 10-Feb-2006 09:59:40
%

names = fieldnames(this);  % tailored version returns public names
values = cell(length(names), length(this(:)));  % preallocate
for k = 1:length(names)
    [values{k, :}] = subsref(this(:), substruct('.', names{k}));
end
public_struct = reshape(cell2struct(values, names, 1), size(this));
