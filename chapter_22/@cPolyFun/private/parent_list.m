function parents = parent_list(varargin)
% cPolyFun::parent_list helper: 
%
% function parents = parent_list(varargin)
%
% Author Info
% Andy Register, Ph.D.
% (c) 2006 Andy Register
% Object-Oriented Programming in MATLAB, Chapter 22
% A class_wizard v.3 assembled file, generated: 13-Sep-2006 16:21:39
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
