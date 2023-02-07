function this = draw(this, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 16 example cStar::draw
%   (c) 2006 Andy Register
if nargout ~= 1
    warning('OOP:invalidMutatorSyntax', ...
        'draw must be called using: obj = draw(obj)');
else
    parent = num2cell(draw([this.cShape], varargin{:}));
    [this.cShape] = deal(parent{:});
end
for k = 1:length(this)
    figure(get(this(k), 'mFigureHandle'));
    title(this(k).mTitle);
end
