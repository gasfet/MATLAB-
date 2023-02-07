function [this_struct, superior, inferior, parents] = ctor_ini
% cLineStyle::ctor initialization helper: 
%
% function [this_struct, superior, inferior, parents] = ctor_ini
%
% Private Member Variables
%    mColorHsv: HSV Line Color Value
%    mLineWidth: handle-graphic LineWidth attribute
%    mLineHandle: graphics handle of the line plot
%
%
%
% Author Info
% Chapter 20
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 17-Jun-2006 14:20:42
%

% piece-meal create to avoid object and cell problems
this_struct = struct([]);
this_struct(1).mDisplayFunc = []; % class-wizard reserved field
this_struct(1).mTempStatic = []; % class-wizard reserved field
this_struct(1).mColorHsv = rgb2hsv([0 0 1])';
this_struct(1).mLineWidth = 1;
this_struct(1).mLineHandle = [];

% initialize and assign static data
if isempty(static)
    static_this = struct([]);
    static_this(1).mLineWidthCounter = [];
    static(static_this);  % stores static_this as persistent
end

% Construct the parent classes, if any
parents = cell(0, 1);
% Initialize parent_list
parent_list(parents{:});

% Return desired superior and inferior arguments
superior = {};
inferior = {};
