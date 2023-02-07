function this = cShape
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 10 example Constructor
%   (c) 2004 Andy Register
class_name = mfilename('class');

persistent default_this
if isempty(default_this)
    % piece-meal create to avoid object and cell problems
    default_this = struct([]);  % initially empty structure
    default_this(1).mSize = ones(2,1); % scaled [width height]’ of bounding box
    default_this(1).mScale = ones(2,1); % [width height]’ scale factor
    default_this(1).mColorHsv = [2/3; 1; 1]; % [H S V]’ of border, default is blue
    default_this(1).mPoints = [imag(exp(j*(0:4:20)*pi/5)); real(exp(j*(0:4:20)*pi/5))];
    default_this(1).mFigureHandle = []; % handle for shape's figure window
    default_this(1).mPlotHandle = [];  % handle for shape's line plot
    default_this(1).mDisplayFunc = [];  % function handle for non-default display    default_this = struct( ...
    default_this = class(default_this, class_name);
    superiorto('double');
end
this = default_this;