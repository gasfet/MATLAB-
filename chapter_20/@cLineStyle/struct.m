function public_struct = struct(this)
% cLineStyle::struct: 
%
% function public_struct = struct(this)
%
%
% Public Member Variables
%    Color: 3x1 array: RGB Line Color
%    LineWidth: integer > 0:
%    LineHandle: graphics handle: public graphics handle to the line plot
%    LineWidthCounter: double array: public interface to static value
%
%
% returns the list of public member variable names
% Author Info
% Chapter 20
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 17-Jun-2006 14:20:43
%

names = fieldnames(this);  % tailored version returns public names
values = cell(length(names), length(this(:)));  % preallocate
for k = 1:length(names)
    [values{k, :}] = reshape(subsref(this, struct('type', '.', 'subs', names{k})), 1, []);
end
public_struct = reshape(cell2struct(values, names, 1), size(this));
