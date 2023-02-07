function this = subsasgn(this, index, varargin)
%SUBSASGN for class cDiamond, Replace with a short note that will appear on the
%         H1 line along with each function description
%
%           Replace with something like UNCLASSIFIED
%
% function this = subsasgn(this, index, varargin)
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
% Author Info:
% Replace with your company's name
% Replace with your name
% Replace with your email address
% Replace with your phone number
% Replace with the author notes that you would like to appear just after the
% author info for every file in this class
% Replace with your standard copyright notice
% Replace this line with a string recognized by your revision control software
% A class_wizard v 3.0 assembled file, generated: 26-Sep-2006 10:22:36
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

%           Replace with something like UNCLASSIFIED
