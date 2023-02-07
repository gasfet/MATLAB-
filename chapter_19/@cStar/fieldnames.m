function names = fieldnames(this, varargin)
% cStar::fieldnames: Replace with a short note that will appear on the H1 li ...
%           Replace with something like UNCLASSIFIED
%
% function names = fieldnames(this, varargin)
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
%
% Public Member Variables
%    Title: string: A title for the figure window
%
%
% Chapter 19
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 08-Feb-2006 17:03:11
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
%           Replace with something like UNCLASSIFIED
