function [do_sub_indexing, do_assignin, this, varargout] = Title_helper(which, this, index, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 16 example cStar::private::Title_helper
%   (c) 2006 Andy Register

switch which
    case 'get'  % ACCESSOR
        % input: index contains any additional indexing as a substruct
        % input: varargin empty for accessor
        do_sub_indexing = true;  % tells get.m whether to index deeper
        do_assignin = false;  % leave it false until you read book section 3
        varargout = cell(1, nargout-3); % -3 due to 3 known vars plus varargout
        varargout = {this.mTitle};
        
    case 'set'  % MUTATOR
        % input: index contains any additional indexing as a substruct
        % input: varargin contains values to be assigned into the object
        do_sub_indexing = false;  % always false for 'set', mutator _must_ do deep indexing
        do_assignin = false;  % leave it false until you read book section 3
        varargout = {}; % 'set' returns nothing in varargout

        if length(index) > 1
            this.mTitle = ...
              subsasgn(this.mTitle, index(2:end), varargin{:});
        else
            [this.mTitle] = deal(varargin{:});
        end
        
        for k = 1:length(this)
            figure(get(this(k), 'mFigureHandle'));
            title(this(k).mTitle);
        end
        
    otherwise
        error('OOP:unsupportedOption', ['Unknown helper option: ' which]);
end
%           Replace with something like UNCLASSIFIED
