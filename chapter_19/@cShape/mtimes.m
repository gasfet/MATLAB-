function this = mtimes(lhs, rhs)
% cShape::mtimes: Function to overload * operator
%           Replace with something like UNCLASSIFIED
%
% function this = mtimes(lhs, rhs)
%
% Description:
%     Function to overload * operator
%
% Member function of the class cShape
%     Replace with text that you would like to have copied into the header of
%     every file in this class
%
% Input Arguments::
%
%     lhs: double, cShape: Left-hand-side argument in an expression. For
%          example, lhs * 2
%
%     rhs: double, cShape: Right-hand-side argument in an expression. For
%          example, 2 * rhs
%
% Output Arguments::
%
%     this: cShape: The current object of type cShape
%
% Chapter 19
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 18-Jan-2006 17:11:36
%

% one input must be cShape type, which one
if isa(lhs, 'cShape')
    this = lhs;
    scale = rhs;
else
    this = rhs;
    scale = lhs;
end
switch length(scale(:))
    case 1
        scale = [scale; scale];
    case 2
        scale = scale(:);
    otherwise
        error('??? Error using ==> mtimes');
end
this.mSize = this.mSize .* scale;
this.mScale = this.mScale .* scale;
for k = 1:length(this(:))
    points = get(this(k), 'Points');
    try
    	set(this(k).mLineStyle.LineHandle, ...
            'XData', this.mSize(1) * points(1,:), ...
            'YData', this.mSize(2) * points(2,:));
    end
end
%           Replace with something like UNCLASSIFIED
