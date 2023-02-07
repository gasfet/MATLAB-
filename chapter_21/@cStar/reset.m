function this = reset(this, varargin)
% cStar::reset: Function used to reset the shape and close its gra...
%           Replace with something like UNCLASSIFIED
%
% function this = reset(this, varargin)
%
% Description:
%     Function used to reset the shape and close its graphics window.
%
% Member function of the class cStar
%     Replace with text that you would like to have copied into the header of
%     every file in this class
%
% Input Arguments::
%
%     this: cStar: The active object of type cStar
%
%     varargin: no type info: a variable input argument list
%
% Output Arguments::
%
%     this: cStar: The active object of type cStar
%
% Chapter 20
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 18-Jan-2006 18:08:22
%

parent = num2cell(reset([this.cShape], varargin{:}));
[this.cShape] = deal(parent{:});
%           Replace with something like UNCLASSIFIED
