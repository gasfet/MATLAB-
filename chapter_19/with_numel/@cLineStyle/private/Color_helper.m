function [do_sub_indexing, do_assignin, this, varargout] = Color_helper(which, this, index, varargin)
% cLineStyle::Color_helper: Replace with a short note that will appear on th ...
%           Replace with something like UNCLASSIFIED
%
% function [do_sub_indexing, do_assignin, this, varargout] = Color_helper(which,
%      this, index, varargin)
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
% Author Info
% Replace with your company's name
% Replace with your name
% Replace with your email address
% Replace with your phone number
% Replace with the author notes that you would like to appear just after the
% author info for every file in this class
% Replace with your standard copyright notice
% Replace this line with a string recognized by your revision control software
% A class_wizard v.3 assembled file, generated: 18-Jan-2006 13:18:46
%

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
%           Replace with something like UNCLASSIFIED
