function [do_sub_indexing, do_assignin, this, varargout] = ColorRgb_helper(which, this, index, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 16 example cShape::/private/ColorRgb_helper.m
%   (c) 2006 Andy Register

switch which
    case 'get'  % ACCESSOR
        % input: index contains any additional indexing as a substruct
        % input: varargin empty for accessor
        do_sub_indexing = true;  % tells get.m whether to index deeper
        do_assignin = false;  % leave it false until you read book section 3
        varargout = cell(1, nargout-3); % -3 due to 3 known vars plus varargout

        line_style = [this.mLineStyle];
        varargout = {line_style.Color};
        
    case 'set'  % MUTATOR
        % input: index contains any additional indexing as a substruct
        % input: varargin contains values to be assigned into the object
        do_sub_indexing = false;  % always false for 'set', mutator _must_ do deep indexing
        do_assignin = false;  % leave it false until you read book section 3
        varargout = {}; % 'set' returns nothing in varargout
        index = [substruct('.', 'Color') index];
        line_style = set([this.mLineStyle], index, varargin{:});
        line_style = num2cell(line_style);
        [this.mLineStyle] = deal(line_style{:});

    otherwise
        error(['Unknown helper option: ' which]);
end
%           UNCLASSIFIED
