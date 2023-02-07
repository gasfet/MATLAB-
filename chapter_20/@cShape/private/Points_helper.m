function [do_sub_indexing, do_assignin, this, varargout] = Points_helper(which, this, index, varargin)
% cShape::Points_helper: Replace with a short note that will appear on the H ...
%           Replace with something like UNCLASSIFIED
%
% function [do_sub_indexing, do_assignin, this, varargout] =
%      Points_helper(which, this, index, varargin)
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
% Chapter 20
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 18-Jan-2006 17:11:36
%

switch which
    case 'get'  % ACCESSOR
        % input: index contains any additional indexing as a substruct
        % input: varargin empty for accessor
        do_sub_indexing = true;  % tells get.m whether to index deeper
        do_assignin = false;  % leave it false until you read book section 3
        varargout = cell(1, nargout-3); % -3 due to 3 known vars plus varargout
        varargout = {this.mPoints};
    
    case 'set'  % MUTATOR
        % input: index contains any additional indexing as a substruct
        % input: varargin contains values to be assigned into the object
        do_sub_indexing = false;  % always false for 'set', mutator _must_ do deep indexing
        do_assignin = false;  % leave it false until you read book section 3
        varargout = {}; % 'set' returns nothing in varargout

        if length(index) > 1
            error('Points:invalidIndex', ...
                'The entire Points array must be assigned at one time');
        else
            for k = 1:length(varargin)
                if size(varargin{k}, 1) ~= 2
                    error('Points must be size 2xN');
                end
            end
            [this.mPoints] = deal(varargin{:});
        end
        
        for k = 1:length(this(:))
            points = get(this(k), 'Points');
            try
                set(this(k).mLineStyle.LineHandle, ...
                    'XData', this.mSize(1) * points(1,:), ...
                    'YData', this.mSize(2) * points(2,:));
            end
        end

    otherwise
        error('OOP:unsupportedOption', ['Unknown helper option: ' which]);
end
%           Replace with something like UNCLASSIFIED
