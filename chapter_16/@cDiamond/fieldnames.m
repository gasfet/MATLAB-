function names = fieldnames(this, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 16 example cDiamond::fieldnames
%   (c) 2006 Andy Register
names = {};
% first fill up names with parent public names
parent_name = parent_list;  % get the parent name cellstr
for parent_name = parent_list'
    names = [names; fieldnames([this.(parent_name{1})], varargin{:})];
end
