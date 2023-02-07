function this = mtimes(lhs, rhs)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 5 example mtimes
%   (c) 2004 Andy Register

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
