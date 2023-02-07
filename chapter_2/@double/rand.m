function value = rand(varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 2 independent investigation example for rand
%   (c) 2005 Andy Register
if isnumeric(varargin{1})
    value = 0.5 * ones(varargin{1});
else
    error('Simple function replacement does not support all calling options')
end
