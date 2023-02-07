function this = cShape
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 5 example Constructor
%   (c) 2004 Andy Register
this = struct( ...
    'mSize', ones(2,1),  ... % scaled [width height]’ of bounding box
    'mScale', ones(2,1), ... % [width height]’ scale factor
    'mColorHsv', rgb2hsv([0 0 1])', ... % [Hue Saturation Color]’ of border, default is blue
    'mDisplayFunc', 'developer_view' ... % alternate display function fun(this, display_name)
    );
this = class(this, 'cShape');
superiorto('double')