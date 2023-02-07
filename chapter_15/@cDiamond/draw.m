function this = draw(this, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 15 example cDiamond::draw
%   (c) 2006 Andy Register

if nargout ~= 1
    warning('draw must be called using: obj = draw(obj)');
else
    parent = [this.cShape];
    parent = draw(parent, varargin{:});
    parent = num2cell(parent);
    [this.cShape] = deal(parent{:});
end