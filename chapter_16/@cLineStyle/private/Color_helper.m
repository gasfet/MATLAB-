function [do_sub_indexing, do_assignin, this, varargout] = ...
    Color_helper(which, this, index, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 16 example cLineStyle::/private/Color_helper.m
%   (c) 2006 Andy Register

switch which
    
    case 'get'  % ACCESSOR
        do_sub_indexing = true;  % true and get will index deeper
        do_assignin = false; % typically false, see book section 3
        rgb = hsv2rgb([this.mColorHsv]')';  % convert color format
        varargout = num2cell(rgb, 1);  % num2cell instead of mat2cell

    case 'set'  % MUTATOR
        do_sub_indexing = false;  % mutator must do deeper indexing
        do_assignin = false; % typically false, see book section 3
        varargout = {};      % mutator doesn't use varargout
        if isempty(index)    % only initial dot-reference value
            rgb = [varargin{:}];  % input values are rgb
        else  % use subsasgn to perform deeper indexing
            if length(this) == 1
                rgb = subsasgn(get(this, 'Color'), index, varargin{:});
            else
                [err_id, err_msg] = array_reference_error(index(1).type);
                error(err_id, err_msg);
            end
        end
        hsv = num2cell(rgb2hsv(rgb')', 1);  % convert rgb to hsv
        [this.mColorHsv] = deal(hsv{:});  % assign new hsv values

        for k = 1:length(this(:))
            try
                set(this(k).mLineHandle, 'Color', get(this(k), 'Color'));
            end
        end

    otherwise
        error('OOP:unsupportedOption', ['Unknown helper option: ' which]);
end