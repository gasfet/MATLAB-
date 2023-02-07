function public_struct = struct(this)
% cShape::struct: 
%
% function public_struct = struct(this)
%
%
% Public Member Variables
%    Size: double (2x1): The horiz (1,1) and vert (2,1) size of the shape's
%        bounding box
%    ColorRgb: double array  (3x1): [R; G; B] color values of the shape
%    Points: double array  (2xN): Corner points, x in row (1,:), y in row (2,:)
%    LineWeight: normal, bold: Weight of the line used to draw the shape.
%        Either 'normal' or 'bold'
%    View: logical: true - develper view, false - standard view, state toggles
%        during access
%
%
% returns the list of public member variable names
% Author Info
% Chapter 21
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 26-Jun-2006 23:54:06
%

names = fieldnames(this);  % tailored version returns public names
values = cell(length(names), length(this(:)));  % preallocate
for k = 1:length(names)
    [values{k, :}] = reshape(subsref(this, struct('type', '.', 'subs', names{k})), 1, []);
end
public_struct = reshape(cell2struct(values, names, 1), size(this));
