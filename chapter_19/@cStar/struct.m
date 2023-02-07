function public_struct = struct(this)
% cStar::struct: Replace with a short note that will appear on the H1 line a ...
%           Replace with something like UNCLASSIFIED
%
% function public_struct = struct(this)
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
%
% Public Member Variables
%    Title: string: A title for the figure window
%
%
% returns the list of public member variable names
% Chapter 19
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 08-Feb-2006 17:03:11
%

names = fieldnames(this);  % tailored version returns public names
values = cell(length(names), length(this(:)));  % preallocate
for k = 1:length(names)
    [values{k, :}] = subsref(this(:), substruct('.', names{k}));
end
public_struct = reshape(cell2struct(values, names, 1), size(this));
%           Replace with something like UNCLASSIFIED
