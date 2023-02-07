function names = fieldnames(this, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 16 example cStar::fieldnames
%   (c) 2006 Andy Register
names = {};
% first fill up names with parent public names
parent_name = parent_list;  % get the parent name cellstr
for parent_name = parent_list'
    names = [names; fieldnames([this.(parent_name{1})], varargin{:})];
end
% then add additional names for child
% returns the list of public member variable names
if nargin == 1
    names = [names; {'Title'}']; % note: return as a column
else
    switch varargin{1}
    case '-full'
        names = [names; {'Title % string'}'];
    case '-possible'
        names = [names; {'Title' {{'string'}}}'];
    otherwise
        error('OOP:unsupportedOption', 'Unsupported call to fieldnames');
    end
end
