function [do_sub_indexing, do_assignin, this, varargout] = LineWeight_helper(which, this, index, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 16 example cShape::/private/LineWeight_helper.m
%   (c) 2006 Andy Register

switch which
    case 'get'  % ACCESSOR
        % input: index contains any additional indexing as a substruct
        % input: varargin empty for accessor
        do_sub_indexing = true;  % tells get.m whether to index deeper
        do_assignin = false;  % leave it false until you read book section 3
        varargout = cell(1, nargout-3); % -3 due to 3 known vars plus varargout
        line_style = [this.mLineStyle];
        line_width = [line_style.LineWidth];
        varargout = cell(1,length(this(:)));
        varargout(line_width == 1) = {'normal'};
        varargout(line_width == 3) = {'bold'};

    case 'set'  % MUTATOR
        % input: index contains any additional indexing as a substruct
        % input: varargin contains values to be assigned into the object
        do_sub_indexing = false;  % always false for 'set', mutator _must_ do deep indexing
        do_assignin = false;  % leave it false until you read book section 3
        varargout = {}; % 'set' returns nothing in varargout
        
        if length(index) > 1
            error('LineWeight:invalidIndex', ...
                'LineWeight does not support indexing');
        end
        
        if length(varargin) ~= 1 && length(varargin) ~= length(this(:))
            error('LineWeight:invalidInputSize', ...
                'LineWeight input must be length == 1 or length == the array size');
        end
        
        normal_sieve = strcmp(varargin, 'normal');
        bold_sieve   = strcmp(varargin, 'bold');
        
        if ~all(normal_sieve | bold_sieve)
            error('LineWeight:invalidValue', ...
                'LineWeight values must be ''normal'' or ''bold''');
        end

        varargin(normal_sieve) = {1};
        varargin(bold_sieve)   = {3};
        index(1).subs = 'LineWidth';
        line_style = set([this.mLineStyle], index, varargin{:});
        line_style = num2cell(line_style);
        [this.mLineStyle] = deal(line_style{:});
        
    otherwise
        error('OOP:unsupportedOption', ['Unknown helper option: ' which]);
end
%           Replace with something like UNCLASSIFIED
