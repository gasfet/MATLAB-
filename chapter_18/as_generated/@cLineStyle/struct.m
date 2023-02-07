function public_struct = struct(this)
%STRUCT for class cLineStyle, Replace with a short note that will appear on the
%       H1 line along with each function description
%
%           Replace with something like UNCLASSIFIED
%
% function public_struct = struct(this)
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
% Public Member Variables
%    Color: 3x1 array: RGB Line Color
%    LineWidth: integer > 0:
%    LineHandle: graphics handle: public graphics handle to the line plot
%
% returns the list of public member variable names
% Author Info:
% Replace with your company's name
% Replace with your name
% Replace with your email address
% Replace with your phone number
% Replace with the author notes that you would like to appear just after the
% author info for every file in this class
% Replace with your standard copyright notice
% Replace this line with a string recognized by your revision control software
% A class_wizard v 3.0 assembled file, generated: 26-Sep-2006 10:21:24
%

names = fieldnames(this);  % tailored version returns public names
values = cell(length(names), length(this(:)));  % preallocate
for k = 1:length(names)
    [values{k, :}] = subsref(this, struct('type', '.', 'subs', names{k}));
end
public_struct = reshape(cell2struct(values, names, 1), size(this));
%           Replace with something like UNCLASSIFIED
