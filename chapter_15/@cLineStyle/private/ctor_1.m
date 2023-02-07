function this = ctor_1(this, in_arg_1)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 15 example cLineStyle::/private/ctor_1.m
%   (c) 2006 Andy Register

if isa(in_arg_1, 'cLineStyle')  % address copy constructor separately
    this = in_arg_1;  % let MATLAB do the copy assignment
else
    % any other input produces an error
    error(['Input is not appropriate for constructing a ' ...
        class(this) ' object']);
end