function [this_struct, superior, inferior, parents] = ctor_ini
%CTOR_INI for class cLineStyle, Replace with a short note that will appear on
%         the H1 line along with each function description
%
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
% Author Info:
% Replace with your company's name
% Replace with your name
% Replace with your email address
% Replace with your phone number
% Replace with the author notes that you would like to appear just after the
% author info for every file in this class
% Replace with your standard copyright notice
% Replace this line with a string recognized by your revision control software
% A class_wizard v 3.0 assembled file, generated: 26-Sep-2006 10:23:00
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
