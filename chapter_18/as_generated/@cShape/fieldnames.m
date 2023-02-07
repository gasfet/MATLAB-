function names = fieldnames(this, varargin)
%FIELDNAMES for class cShape, Replace with a short note that will appear on the
%           H1 line along with each function description
%
%           Replace with something like UNCLASSIFIED
%
% function names = fieldnames(this, varargin)
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
% Public Member Variables
%    Size: double (2x1): The horiz (1,1) and vert (2,1) size of the shape's
%        bounding box
%    ColorRgb: double array  (3x1): [R; G; B] color values of the shape
%    Points: double array  (2xN): Corner points, x in row (1,:), y in row (2,:)
%    LineWeight: normal, bold: Weight of the line used to draw the shape.
%        Either 'normal' or 'bold'
%
% Author Info:
% Replace with your company's name
% Replace with your name
% Replace with your email address
% Replace with your phone number
% Replace with the author notes that you would like to appear just after the
% author info for every file in this class
% Replace with your standard copyright notice
% Replace this line with a string recognized by your revision control software
% A class_wizard v 3.0 assembled file, generated: 26-Sep-2006 10:21:45
%

names = {};

% first fill up names with parent public names
parent_name = parent_list;  % get the parent name cellstr
for parent_name = parent_list'
    names = [names; fieldnames(feval(parent_name{1}), varargin{:})];
end

% then add additional names for child
% note: return names as a column
% note: names in the list must be unique and unique also sorts
if nargin == 1
    names = [names; {'Size' 'ColorRgb' 'Points' 'LineWeight'}'];
    names = unique(names);
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
%           Replace with something like UNCLASSIFIED
