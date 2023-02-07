function this = ctor_1(this, InitialPoints)
% cShape::ctor_1: Replace with a short note that will appear on the H1 line  ...
%           Replace with something like UNCLASSIFIED
%
% function this = ctor_1(this, InitialPoints)
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
% Input Arguments::
%
%     InitialPoints: double array (2xN): Allows specific corner point values to
%          be assigned during construction
%
% Author Info
% Replace with your company's name
% Replace with your name
% Replace with your email address
% Replace with your phone number
% Replace with the author notes that you would like to appear just after the
% author info for every file in this class
% Replace with your standard copyright notice
% Replace this line with a string recognized by your revision control software
% A class_wizard v.3 assembled file, generated: 18-Jan-2006 17:11:36
%

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
%           Replace with something like UNCLASSIFIED
