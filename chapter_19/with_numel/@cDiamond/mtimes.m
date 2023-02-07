function this = mtimes(lhs, rhs)
% cDiamond::mtimes: Function to overload * operator
%           Replace with something like UNCLASSIFIED
%
% function this = mtimes(lhs, rhs)
%
% Description:
%     Function to overload * operator
%
% Member function of the class cDiamond
%     Replace with text that you would like to have copied into the header of
%     every file in this class
%
% Input Arguments::
%
%     lhs: double, cStar: Left-hand-side argument in an expression
%
%     rhs: double, cStar: Right-hand-side argument in an expression
%
% Output Arguments::
%
%     this: cStar: The active object of type cStar
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
% A class_wizard v.3 assembled file, generated: 18-Jan-2006 19:05:07
%

if isa(lhs, 'cShape')
    this = lhs;
    parent = num2cell(mtimes([this.cShape], rhs));
    [this(:).cShape] = deal(parent{:});
else
    this = rhs;
    parent = num2cell(mtimes(lhs, [this.cShape]));
    [this.cShape] = deal(parent{:});
end
%           Replace with something like UNCLASSIFIED
