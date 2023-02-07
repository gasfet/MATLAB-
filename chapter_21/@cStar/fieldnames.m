function names = fieldnames(this, varargin)
% cStar::fieldnames: 
%
% function names = fieldnames(this, varargin)
%
%
% Public Member Variables
%    Title: string: A title for the figure window
%
%
% Author Info
% Chapter 20
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 17-Jun-2006 14:21:15
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
  names = [names; {'Title'}'];
else
    switch varargin{1}
    case '-full'
        names = [names; { ...
                 'Title % string' ... 
             }'];
    case '-possible'
        names = [names; { ...
                 'Title' {{'string'}} ...
             }'];
    otherwise
        error('OOP:unsupportedOption', 'Unsupported call to fieldnames');
    end
end
