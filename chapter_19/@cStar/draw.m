function this = draw(this, varargin)
% cStar::draw: Opens a figure window and draws the shape
%           Replace with something like UNCLASSIFIED
%
% function this = draw(this, varargin)
%
% Description:
%     Opens a figure window and draws the shape
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
% Chapter 19
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 18-Jan-2006 18:08:22
%

if nargout ~= 1
    warning('OOP:invalidMutatorSyntax', ...
        'draw must be called using: obj = draw(obj)');
else
    parent = num2cell(draw([this.cShape], varargin{:}));
    [this.cShape] = deal(parent{:});
end
for k = 1:length(this)
    figure(get(this(k), 'mFigureHandle'));
    title(this(k).mTitle);
end
%           Replace with something like UNCLASSIFIED
