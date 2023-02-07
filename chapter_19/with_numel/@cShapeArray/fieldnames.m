function names = fieldnames(this, varargin)
% cShapeArray::fieldnames: 
%
% function names = fieldnames(this, varargin)
%
% Chapter 19
%
% Author Info
% Copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 10-Feb-2006 09:59:40
%

names = {};

% first fill up names with parent public names
parent_name = parent_list;  % get the parent name cellstr
for parent_name = parent_list'
    names = [names; fieldnames(feval(parent_name{1}), varargin{:})];
end

% add names for the container type
names = [names; fieldnames(feval(this.mType), varargin{:})];
