function this = setScale(this, ShapeScale)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 3 setScale
%   (c) 2004 Andy Register

this = reset(this);  % back to original size
switch length(ShapeScale(:))
    case 1
        this.mScale = [ShapeScale; ShapeScale];
    case 2
        this.mScale = ShapeScale(:);  % ensure 2x1
    otherwise
        error('ShapeScale must be a scalar or length == 2');
end
this.mSize = this.mSize .* this.mScale;  % apply new scale