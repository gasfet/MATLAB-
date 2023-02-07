function names = fieldnames(this, varargin)
% cLineStyle::fieldnames: Replace with a short note that will appear on the  ...
%           Replace with something like UNCLASSIFIED
%
% function names = fieldnames(this, varargin)
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
% Author Info
% Replace with your company's name
% Replace with your name
% Replace with your email address
% Replace with your phone number
% Replace with the author notes that you would like to appear just after the
% author info for every file in this class
% Replace with your standard copyright notice
% Replace this line with a string recognized by your revision control software
% A class_wizard v.3 assembled file, generated: 08-Feb-2006 17:02:11
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
  names = [names; {'Color' 'LineWidth' 'LineHandle'}'];
else
    switch varargin{1}
    case '-full'
        names = [names; { ...
                 'Color % 3x1 array' ... 
                 'LineWidth % integer > 0' ... 
                 'LineHandle % graphics handle' ... 
             }'];
    case '-possible'
        names = [names; { ...
                 'Color' {{'3x1 array'}} ...
                 'LineWidth' {{'integer > 0'}} ...
                 'LineHandle' {{'graphics handle'}} ...
             }'];
    otherwise
        error('OOP:unsupportedOption', 'Unsupported call to fieldnames');
    end
end
%           Replace with something like UNCLASSIFIED
