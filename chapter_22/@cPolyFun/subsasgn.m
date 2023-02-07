function this = subsasgn(this, index, varargin)
% cPolyFun::subsasgn: 
%
% function this = subsasgn(this, index, varargin)
%
%
% Public Member Variables
%    coef: length-N matrix of doubles: Used to hold polynomial coefficients for
%        the expression, a(1) + a(2)*x^2 + a(3)*x^3 + ...
%
%
% Author Info
% Andy Register, Ph.D.
% (c) 2006 Andy Register
% Object-Oriented Programming in MATLAB, Chapter 22
% A class_wizard v.3 assembled file, generated: 13-Sep-2006 16:21:39
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
