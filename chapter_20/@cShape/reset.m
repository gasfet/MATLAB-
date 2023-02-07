function this = reset(this)
% cShape::reset: Function used to reset the shape and close its gra...
%           Replace with something like UNCLASSIFIED
%
% function this = reset(this)
%
% Description:
%     Function used to reset the shape and close its graphics window.
%
% Member function of the class cShape
%     Replace with text that you would like to have copied into the header of
%     every file in this class
%
% Input Arguments::
%
%     this: cShape: The current object of type cShape
%
% Output Arguments::
%
%     this: cShape: The current object of type cShape
%
% Chapter 20
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 18-Jan-2006 17:11:36
%

for k = 1:length(this(:))
    this(k).mSize = this(k).mSize ./ this(k).mScale; % divide by scale
    this(k).mScale = ones(2,1);  % reset scale to 1:1
    try
        delete(this(k).mFigureHandle);
    end
    this(k).mFigureHandle = [];
    this(k).mLineStyle.LineHandle = [];
end
%           Replace with something like UNCLASSIFIED
