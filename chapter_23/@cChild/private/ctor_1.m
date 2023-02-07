function this = ctor_1(this, in_arg_1)
% cChild::ctor_1: 
%
% function this = ctor_1(this, in_arg_1)
%
% Chapter 23, Object-Oriented MATLAB
%
% Input Arguments::
%
% in_arg_1: no type info: no description provided
%
% Author Info
% Andy Register, Ph.D.
% (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 18-Sep-2006 12:07:47
%

if isa(in_arg_1, 'cChild')  % address copy constructor separately
    this = in_arg_1;  % let MATLAB do the copy assignment
else
    % \/  \/  \/  \/
    % develop if-else and code for 1-argument constructor other than copy constructor
    warning('OOP:incompleteFunction', 'The function definition is incomplete');
    % /\  /\  /\  /\
end
