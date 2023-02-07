function this = setSize(this, ShapeSize)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 3 setSize
%   (c) 2004 Andy Register

this.mScale = ones(2,1);    % reset scale to 1:1 when size is set
switch length(ShapeSize(:))
    case 1
        this.mSize = [ShapeSize; ShapeSize];
    case 2
        this.mSize = ShapeSize(:);  % ensure 2x1
    otherwise
        error('ShapeSize must be a scalar or length == 2');
end