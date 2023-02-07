function this = cShape
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 3 example Constructor
%   (c) 2004 Andy Register
this = struct( ... 
	'mSize', ones(2,1),  ... % scaled [width height]’ of bounding box
	'mScale', ones(2,1), ... % [width height]’ scale factor
	'mColorRgb', [0 0 1]' ... % [R G B]’ of border, default is blue
	);
this = class(this, 'cShape');
