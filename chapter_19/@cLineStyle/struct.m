function public_struct = struct(this)
% cLineStyle::struct: Replace with a short note that will appear on the H1 l ...
%           Replace with something like UNCLASSIFIED
%
% function public_struct = struct(this)
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
%
% Public Member Variables
%    Color: 3x1 array: RGB Line Color
%    LineWidth: integer > 0:
%    LineHandle: graphics handle: public graphics handle to the line plot
%
%
% returns the list of public member variable names
% Chapter 19
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 08-Feb-2006 17:02:11
%

names = fieldnames(this);  % tailored version returns public names
values = cell(length(names), length(this(:)));  % preallocate
for k = 1:length(names)
    [values{k, :}] = subsref(this(:), substruct('.', names{k}));
end
public_struct = reshape(cell2struct(values, names, 1), size(this));
%           Replace with something like UNCLASSIFIED
