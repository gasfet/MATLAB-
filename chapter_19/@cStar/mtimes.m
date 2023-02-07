function this = mtimes(lhs, rhs)
% cStar::mtimes: Function to overload * operator
%           Replace with something like UNCLASSIFIED
%
% function this = mtimes(lhs, rhs)
%
% Description:
%     Function to overload * operator
%
% Member function of the class cStar
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
% Chapter 19
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 18-Jan-2006 18:08:22
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
