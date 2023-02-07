function [this, superior, inferior, parents] = ctor_ini
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 16 example cShape::/private/ini.m
%   (c) 2006 Andy Register

% piece-meal create to avoid object and cell problems
this = struct([]);  % initially empty structure
this(1).mDisplayFunc = [];  % function handle for non-default display
this(1).mColorHsv = [2/3; 1; 1]; % [H S V]’ of border, default is blue
this(1).mLineWidth = 1; % line weight: 'normal' == 1 'bold' == 3
this(1).mLineHandle = [];  % handle for shape's line plot

superior = {};
inferior = {};

parents = {};
parent_list(parents{:});