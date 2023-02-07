function this = draw(this, varargin)
% cDiamond::draw: Opens a figure window and draws the shape
%           Replace with something like UNCLASSIFIED
%
% function this = draw(this, varargin)
%
% Description:
%     Opens a figure window and draws the shape
%
% Member function of the class cDiamond
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
% A class_wizard v.3 assembled file, generated: 18-Jan-2006 19:05:07
%

if nargout == 1
    do_assignin = false;
else
    do_assignin = true;
    callers_this = inputname(1);
    if isempty(callers_this)
        error('draw must be called using: obj = draw(obj) or draw(obj) where obj is a pure variable')
    end
end

parent = [this.cShape];
parent = draw(parent, varargin{:});
parent = num2cell(parent);
[this.cShape] = deal(parent{:});

if do_assignin
  assignin('caller', callers_this, this);
end

