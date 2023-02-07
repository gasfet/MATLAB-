function names = fieldnames(this, varargin)
% cLineStyle::fieldnames: 
%
% function names = fieldnames(this, varargin)
%
%
% Public Member Variables
%    Color: 3x1 array: RGB Line Color
%    LineWidth: integer > 0:
%    LineHandle: graphics handle: public graphics handle to the line plot
%    LineWidthCounter: double array: public interface to static value
%
%
% Author Info
% Chapter 20
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 17-Jun-2006 14:20:43
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
  names = [names; {'Color' 'LineWidth' 'LineHandle' 'LineWidthCounter'}'];
else
    switch varargin{1}
    case '-full'
        names = [names; { ...
                 'Color % 3x1 array' ... 
                 'LineWidth % integer > 0' ... 
                 'LineHandle % graphics handle' ... 
                 'LineWidthCounter % double array' ... 
             }'];
    case '-possible'
        names = [names; { ...
                 'Color' {{'3x1 array'}} ...
                 'LineWidth' {{'integer > 0'}} ...
                 'LineHandle' {{'graphics handle'}} ...
                 'LineWidthCounter' {{'double array'}} ...
             }'];
    otherwise
        error('OOP:unsupportedOption', 'Unsupported call to fieldnames');
    end
end
