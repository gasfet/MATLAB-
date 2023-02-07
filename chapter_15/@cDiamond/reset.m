function this = reset(this, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 15 cDiamond::reset
%   (c) 2006 Andy Register

parent = num2cell(reset([this.cShape], varargin{:}));
[this.cShape] = deal(parent{:});