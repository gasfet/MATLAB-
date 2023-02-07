function names = fieldnames(this, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 15 example cShape::fieldnames
%   (c) 2006 Andy Register

names = {};

% first fill up names with parent public names
parent_name = parent_list;  % get the parent name cellstr
for parent_name = parent_list'
    names = [names; fieldnames([this.(parent_name{1})], varargin{:})];
end

% returns the list of public member variable names
if nargin == 1
    names = [names; {'Size' 'ColorRgb' 'Points' 'LineWeight'}'];
else
    switch varargin{1}
    case '-full'
        names = [names; {'Size % double array' ...
                 'ColorRgb % double array' ...
                 'Points % double array' ...
                 'LineWeight % string'}'];
    case '-possible'
        names = [names; {'Size' {{'double array (2x1)'}} ...
                 'ColorRgb' {{'double array  (3x1)'}} ...
                 'Points' {{'double array  (2xN)'}} ...
                 'LineWeight' {{'normal' 'bold'}}}'];
    otherwise
        error('Unsupported call to fieldnames');
    end
end