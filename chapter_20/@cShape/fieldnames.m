function names = fieldnames(this, varargin)
% cShape::fieldnames: 
%
% function names = fieldnames(this, varargin)
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
% Author Info
% Chapter 20
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 17-Jun-2006 14:25:08
%

names = {};

% first fill up names with parent public names
parent_name = parent_list;  % get the parent name cellstr
for parent_name = parent_list'
    names = [names; fieldnames(feval(parent_name{1}), varargin{:})];
end

% then add additional names for child
% note: return names as a column
if nargin == 1
  names = [names; {'Size' 'ColorRgb' 'Points' 'LineWeight'}'];
else
    switch varargin{1}
    case '-full'
        names = [names; { ...
                 'Size % double (2x1)' ... 
                 'ColorRgb % double array  (3x1)' ... 
                 'Points % double array  (2xN)' ... 
                 'LineWeight % normal, bold' ... 
             }'];
    case '-possible'
        names = [names; { ...
                 'Size' {{'double (2x1)'}} ...
                 'ColorRgb' {{'double array  (3x1)'}} ...
                 'Points' {{'double array  (2xN)'}} ...
                 'LineWeight' {{'normal' 'bold'}} ...
             }'];
    otherwise
        error('OOP:unsupportedOption', 'Unsupported call to fieldnames');
    end
end
