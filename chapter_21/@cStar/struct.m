function public_struct = struct(this)
% cStar::struct: 
%
% function public_struct = struct(this)
%
%
% Public Member Variables
%    Title: string: A title for the figure window
%
%
% returns the list of public member variable names
% Author Info
% Chapter 20
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 17-Jun-2006 14:21:15
%

names = fieldnames(this);  % tailored version returns public names
values = cell(length(names), length(this(:)));  % preallocate
for k = 1:length(names)
    [values{k, :}] = reshape(subsref(this, struct('type', '.', 'subs', names{k})), 1, []);
end
public_struct = reshape(cell2struct(values, names, 1), size(this));
