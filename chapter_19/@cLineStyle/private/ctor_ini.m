function [this_struct, superior, inferior, parents] = ctor_ini
% cLineStyle::ctor initialization helper: Replace with a short note that wil ...
%           Replace with something like UNCLASSIFIED
%
% function [this_struct, superior, inferior, parents] = ctor_ini
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
% Private Member Variables
%    mColorHsv: HSV Line Color Value
%    mLineWidth: handle-graphic LineWidth attribute
%    mLineHandle: graphics handle of the line plot
%
%
%
% Chapter 19
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 08-Feb-2006 17:02:11
%

% piece-meal create to avoid object and cell problems
this_struct = struct([]);
this_struct(1).mDisplayFunc = []; % class-wizard reserved field
this_struct(1).mColorHsv = rgb2hsv([0 0 1])';
this_struct(1).mLineWidth = 1;
this_struct(1).mLineHandle = [];

% Construct the parent classes, if any
parents = cell(0, 1);
% Initialize parent_list
parent_list(parents{:});

% Return desired superior and inferior arguments
superior = {};
inferior = {};

%           Replace with something like UNCLASSIFIED
