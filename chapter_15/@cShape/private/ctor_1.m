function this = ctor_1(this, in_arg_1)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 15 example cShape::/private/ctor_1.m
%   (c) 2006 Andy Register

if isa(in_arg_1, 'cShape')  % address copy constructor separately
    this = in_arg_1;  % let MATLAB do the copy assignment
elseif isempty(in_arg_1)
    this.mPoints = zeros(2,0); % empty, size 2x0
elseif isnumeric(in_arg_1)
    this = set(this, 'Points', in_arg_1);  % copy in the data
else
    % any other input produces an error
    error(['Input is not appropriate for constructing a ' ...
        class(this) ' object']);
end