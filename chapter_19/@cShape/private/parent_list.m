function parents = parent_list(varargin)
% cShape::parent_list helper: Replace with a short note that will appear on  ...
%           Replace with something like UNCLASSIFIED
%
% function parents = parent_list(varargin)
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
% Chapter 19
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 08-Feb-2006 17:02:23
%

persistent parent_cellstr

if nargin > 0
    parent_cellstr = cell(nargin, 1);
    for index = 1:nargin
        parent_cellstr{index,1} = class(varargin{index});
    end
    if sscanf(version, '%g%x') < 7.0 && nargout == 1
        % parent is stored in object using lower case in v.6.5
        % if not being called from ctor, change parent_name to lower case
        parent_cellstr = lower(parent_cellstr);
    end
end
parents = parent_cellstr;
%           Replace with something like UNCLASSIFIED
