function this = ctor_1(this, in_arg_1)
% cShapeArray::ctor_1: 
%
% function this = ctor_1(this, in_arg_1)
%
% Chapter 19
%
% Input Arguments::
%
% in_arg_1: no type info: no description provided
%
% Chapter 19
% Copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 10-Feb-2006 09:59:40
%

if isa(in_arg_1, 'cShapeArray')  % address copy constructor separately
    this = in_arg_1;  % let MATLAB do the copy assignment
else
    % \/  \/  \/  \/
    % develop if-else and code for 1-argument constructor other than copy constructor
    warning('OOP:incompleteFunction', 'The function definition is incomplete');
    % /\  /\  /\  /\
end
