function this = constructor(varargin)
% cShape::constructor: 
%
% function this = constructor(varargin)
%
% Private Member Variables
%    mSize: scaled [width height]’ of bounding box
%    mScale: [width height]’ scale factor
%    mPoints: columns of [x; y] shape corner values
%    mFigureHandle: handle for shape's figure window
%    mLineStyle: Secondary cLineStyle object
%
% Public Member Variables
%    Size: double (2x1): The horiz (1,1) and vert (2,1) size of the shape's
%        bounding box
%    ColorRgb: double array  (3x1): [R; G; B] color values of the shape
%    Points: double array  (2xN): Corner points, x in row (1,:), y in row (2,:)
%    LineWeight: normal, bold: Weight of the line used to draw the shape.
%        Either 'normal' or 'bold'
%
% concealed Member Variables
%    mFigureHandle: graphics handle: The shape's handle graphics handle
%
% Author Info
% Chapter 20
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 17-Jun-2006 14:25:08
%

class_name = mfilename('class');

persistent default_this
if isempty(default_this)
    [default_struct, superior, inferior, parents] = ctor_ini;  % call /private/ctor_ini.m
    default_this = class(default_struct, class_name, parents{:});

    if ~isempty(superior)
        superiorto(superior{:});
    end
    if ~isempty(inferior)
        inferiorto(inferior{:});
    end
end
this = default_this;
if nargin > 0  % if default nothing else to do otherwise pass varargin to helper
    try
        this = feval(sprintf('ctor_%d', nargin), this, varargin{:});
    catch
        err = lasterror;
        switch err.identifier
            case 'MATLAB:UndefinedFunction'
                err.message = [['class ' class_name ' cannot be constructed from '] ...
                    [sprintf('%d', nargin) ' input argument(s) ']];
        end
        rethrow(err);
    end
end 
