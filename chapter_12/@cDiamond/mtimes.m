function this = mtimes(lhs, rhs)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 12 example cDiamond::mtimes
%   (c) 2004 Andy Register

if isa(lhs, 'cShape')
    this = lhs;
    parent = num2cell(mtimes([this.cShape], rhs));
    [this(:).cShape] = deal(parent{:});
else
    this = rhs;
    parent = num2cell(mtimes(lhs, [this.cShape]));
    [this.cShape] = deal(parent{:});
end