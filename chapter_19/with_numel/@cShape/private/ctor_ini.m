function [this_struct, superior, inferior, parents] = ctor_ini
% cShape::ctor initialization helper: Replace with a short note that will ap ...
%           Replace with something like UNCLASSIFIED
%
% function [this_struct, superior, inferior, parents] = ctor_ini
%
% Replace with text that you would like to have copied into the header of every
% file in this class
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
% Replace with your company's name
% Replace with your name
% Replace with your email address
% Replace with your phone number
% Replace with the author notes that you would like to appear just after the
% author info for every file in this class
% Replace with your standard copyright notice
% Replace this line with a string recognized by your revision control software
% A class_wizard v.3 assembled file, generated: 08-Feb-2006 17:02:23
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

%           Replace with something like UNCLASSIFIED
