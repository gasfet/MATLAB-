function return_val = ColorRgb(this, Color)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 3 ColorRgb
%   (c) 2004 Andy Register

switch nargin  % get or set depending on number of arguments
    case 1
        return_val = getColorRgb(this);
    case 2
        return_val = setColorRgb(this, Color);
end

% -----------------------------------
function ColorRgb = getColorRgb(this)
ColorRgb = this.mColorRgb;

% -----------------------------------
function this = setColorRgb(this, Color)
if length(Color(:)) ~= 3
    error('Color must be length == 3');
end
if any(Color(:) > 1) | any(Color(:) < 0)
    error('All Color values must be between 0 and 1');
end
this.mColorRgb = Color(:);  % ensure 3x1