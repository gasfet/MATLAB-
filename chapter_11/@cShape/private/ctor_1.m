function this = ctor_1(this, InitialPoints)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 11 example /private/ctor_1.m
%   (c) 2004 Andy Register

if isa(InitialPoints, 'cShape')  % address copy constructor separately
    this = InitialPoints;  % let MATLAB do the copy assignment
elseif isempty(InitialPoints)
    this.mPoints = zeros(2,0); % empty, size 2x0
elseif isnumeric(InitialPoints)
    this = set(this, 'Points', InitialPoints);  % copy in the data
else
    % any other input produces an error
    error(['Input is not appropriate for constructing a ' ...
        class(this) ' object']);
end