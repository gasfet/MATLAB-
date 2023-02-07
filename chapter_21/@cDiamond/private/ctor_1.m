function this = ctor_1(this, in_arg_1)
% cDiamond::ctor_1: Replace with a short note that will appear on the H1 lin ...
%           Replace with something like UNCLASSIFIED
%
% function this = ctor_1(this, in_arg_1)
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
% Input Arguments::
%
% in_arg_1: no type info: no description provided
%
% Chapter 20
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 18-Jan-2006 19:05:07
%

if isa(in_arg_1, 'cDiamond')  % address copy constructor separately
    this = in_arg_1;  % let MATLAB do the copy assignment
else
    % \/  \/  \/  \/
    % develop if-else and code for 1-argument constructor other than copy constructor
    warning('OOP:incompleteFunction', 'The function definition is incomplete');
    % /\  /\  /\  /\
end
%           Replace with something like UNCLASSIFIED
