function this = mtimes(lhs, rhs)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 15 example cShape::mtimes
%   (c) 2006 Andy Register

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
