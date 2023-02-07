function names = fieldnames(this, varargin)
% cBizzare::fieldnames: 
%
% function names = fieldnames(this, varargin)
%
%
% Public Member Variables
%    show_arg: operator member function: Does a full display of arguments
%        passed through to the function
%
%
% Author Info
% Andy Register
% (c) 2006 Andy Register
% Chapter 22 Object-Oriented Programming in MATLAB
% A class_wizard v.3 assembled file, generated: 10-Sep-2006 13:57:36
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
    names = [names; {'show_arg'}'];
    names = unique(names);
else
    switch varargin{1}
    case '-full'
        names = [names; { ...
                 'show_arg % operator member function' ... 
             }'];
    case '-possible'
        names = [names; { ...
                 'show_arg' {{'operator member function'}} ...
             }'];
    otherwise
        error('OOP:unsupportedOption', 'Unsupported call to fieldnames');
    end
end
