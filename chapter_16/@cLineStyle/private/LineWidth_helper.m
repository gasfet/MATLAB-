function [do_sub_indexing, do_assignin, this, varargout] = ...
    LineWidth_helper(which, this, index, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 16 example cLineStyle::/private/LineWidth_helper.m
%   (c) 2006 Andy Register

switch which
    
    case 'get'  % ACCESSOR
        do_sub_indexing = true;  % true and get will index deeper
        do_assignin = false; % typically false, see book section 3
        varargout = {this.mLineWidth};
        
    case 'set'  % MUTATOR
        do_sub_indexing = false;  % mutator must do deeper indexing
        do_assignin = false; % typically false, see book section 3
        varargout = {};      % mutator doesn't use varargout

        if length(index) > 0
            error('LineWidth:invalidIndex', ...
                'LineWidth does not support indexing');
        end
        
        if any([varargin{:}] < 1)
            error('LineWidth:invalidValue', ...
                'Linewidth values must be >= 1');
        end
        
        if length(varargin) ~= 1 && length(varargin) ~= length(this(:))
            error('LineWidth:invalidInputSize', ...
                'LineWidth input must be length == 1 or length == the array size');
        end
        
        [this.mLineWidth] = deal(varargin{:});
        
        for k = 1:length(this(:))
            try
                set(this(k).mLineHandle, 'LineWidth', get(this(k), 'LineWidth'));
            end
        end

    otherwise
        error('OOP:unsupportedOption', ['Unknown helper option: ' which]);
end