function [this, superior, inferior, parents] = ctor_ini
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 13 example cShape::/private/ini.m
%   (c) 2004 Andy Register

% piece-meal create to avoid object and cell problems
this = struct([]);  % initially empty structure
this(1).mSize = ones(2,1); % scaled [width height]’ of bounding box
this(1).mScale = ones(2,1); % [width height]’ scale factor
this(1).mColorHsv = [2/3; 1; 1]; % [H S V]’ of border, default is blue
this(1).mPoints = [imag(exp(j*(0:4:20)*pi/5)); real(exp(j*(0:4:20)*pi/5))];
this(1).mFigureHandle = []; % handle for shape's figure window
this(1).mPlotHandle = [];  % handle for shape's line plot
this(1).mDisplayFunc = [];  % function handle for non-default display

superior = {'double'};
inferior = {};

parents = {};
parent_list(parents{:});