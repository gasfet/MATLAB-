function this = subsasgn(this, index, varargin)
% cShape::subsasgn: 
%
% function this = subsasgn(this, index, varargin)
%
%
% Public Member Variables
%    Size: double (2x1): The horiz (1,1) and vert (2,1) size of the shape's
%        bounding box
%    ColorRgb: double array  (3x1): [R; G; B] color values of the shape
%    Points: double array  (2xN): Corner points, x in row (1,:), y in row (2,:)
%    LineWeight: normal, bold: Weight of the line used to draw the shape.
%        Either 'normal' or 'bold'
%    View: logical: true - develper view, false - standard view, state toggles
%        during access
%
%
% Author Info
% Chapter 21
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 26-Jun-2006 23:54:06
%

do_assignin = false; % special variable, see book section 3

switch index(1).type

    case '.'
        try
            this = set(this, index, varargin{end:-1:1});
        catch
            rethrow(lasterror);
        end

    case '()'
        if isempty(this)
            % due to superiorto, need to look at this and varargin
            if isa(this, mfilename('class'))
                this = eval(class(this));
            else
                this = eval(class(varargin{1}));
            end
        end
        if length(index) == 1
            if length(varargin) > 1
                error('OOP:UnexpectedInputSize', ...
                ['Only one input is allowed for () assignment.']);
            end
            if isempty(varargin{1}) || strcmp(class(varargin{1}), mfilename('class'))
                this = builtin('subsasgn', this, index, varargin{end:-1:1});
            else
                error('OOP:UnexpectedType', ...
                ['Conversion to ' mfilename('class') ' from ' ...
                class(mismatched{1}) ' is not possible.']);
            end
        else
            this_subset = this(index(1).subs{:});  % get the subset
            this_subset = subsasgn(this_subset, index(2:end), varargin{:});
            this(index(1).subs{:}) = this_subset; % put subset back
        end

    case '{}'
      error('OOP:unsupportedOption', ...
            ['??? ' class(this) ' object, is not a cell array']);

    otherwise
        error('OOP:unexpectedIndex', ...
             ['??? Unexpected index.type of ' index(1).type]);
end

