function this = ctor_1(this, in_arg_1)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 13 example cDiamond::/private/ctor_1.m
%   (c) 2004 Andy Register

if isa(in_arg_1, 'cDiamond')  % address copy constructor separately
    this = in_arg_1;  % let MATLAB do the copy assignment
else
    this.cShape = cShape(in_arg_1);
end
%           UNCLASSIFIED
