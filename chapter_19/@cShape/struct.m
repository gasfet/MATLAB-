function public_struct = struct(this)
% cShape::struct: Replace with a short note that will appear on the H1 line  ...
%           Replace with something like UNCLASSIFIED
%
% function public_struct = struct(this)
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
%
% Public Member Variables
%    Size: double (2x1): The horiz (1,1) and vert (2,1) size of the shape's
%        bounding box
%    ColorRgb: double array  (3x1): [R; G; B] color values of the shape
%    Points: double array  (2xN): Corner points, x in row (1,:), y in row (2,:)
%    LineWeight: normal, bold: Weight of the line used to draw the shape.
%        Either 'normal' or 'bold'
%
%
% returns the list of public member variable names
% Chapter 19
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 08-Feb-2006 17:02:23
%

names = fieldnames(this);  % tailored version returns public names
values = cell(length(names), length(this(:)));  % preallocate
for k = 1:length(names)
    [values{k, :}] = subsref(this(:), substruct('.', names{k}));
end
public_struct = reshape(cell2struct(values, names, 1), size(this));
%           Replace with something like UNCLASSIFIED
