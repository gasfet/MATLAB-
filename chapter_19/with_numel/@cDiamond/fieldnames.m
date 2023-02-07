function names = fieldnames(this, varargin)
% cDiamond::fieldnames: Replace with a short note that will appear on the H1 ...
%           Replace with something like UNCLASSIFIED
%
% function names = fieldnames(this, varargin)
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
%
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
% A class_wizard v.3 assembled file, generated: 08-Feb-2006 17:02:00
%

names = {};

% first fill up names with parent public names
parent_name = parent_list;  % get the parent name cellstr
for parent_name = parent_list'
    names = [names; fieldnames(feval(parent_name{1}), varargin{:})];
end

% then add additional names for child
% note: return names as a column
%           Replace with something like UNCLASSIFIED
