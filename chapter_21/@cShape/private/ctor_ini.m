function [this_struct, superior, inferior, parents] = ctor_ini
% cShape::ctor initialization helper: 
%
% function [this_struct, superior, inferior, parents] = ctor_ini
%
% Private Member Variables
%    mSize: scaled [width height]’ of bounding box
%    mScale: [width height]’ scale factor
%    mPoints: columns of [x; y] shape corner values
%    mFigureHandle: handle for shape's figure window
%    mLineStyle: Secondary cLineStyle object
%
%
%
% Author Info
% Chapter 21
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 26-Jun-2006 23:54:06
%

% piece-meal create to avoid object and cell problems
this_struct = struct([]);
this_struct(1).mDisplayFunc = []; % class-wizard reserved field
this_struct(1).mSize = ones(2,1);
this_struct(1).mScale = ones(2,1);
this_struct(1).mPoints = zeros(2,0);
this_struct(1).mFigureHandle = [];
this_struct(1).mLineStyle = cLineStyle([0;0;1], 1);

% Construct the parent classes, if any
parents = cell(0, 1);
% Initialize parent_list
parent_list(parents{:});

% Return desired superior and inferior arguments
superior = {'double' };
inferior = {};
