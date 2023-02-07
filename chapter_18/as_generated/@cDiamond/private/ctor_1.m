function this = ctor_1(this, in_arg_1)
%CTOR_1 for class cDiamond, Replace with a short note that will appear on the
%       H1 line along with each function description
%
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
% Author Info:
% Replace with your company's name
% Replace with your name
% Replace with your email address
% Replace with your phone number
% Replace with the author notes that you would like to appear just after the
% author info for every file in this class
% Replace with your standard copyright notice
% Replace this line with a string recognized by your revision control software
% A class_wizard v 3.0 assembled file, generated: 26-Sep-2006 10:20:53
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
