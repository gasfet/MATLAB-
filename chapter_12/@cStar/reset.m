function this = reset(this, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 12 cStar::reset
%   (c) 2004 Andy Register

parent = num2cell(reset([this.cShape], varargin{:}));
[this.cShape] = deal(parent{:});