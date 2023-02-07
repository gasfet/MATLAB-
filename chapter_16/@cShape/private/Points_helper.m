function [do_sub_indexing, do_assignin, this, varargout] = Points_helper(which, this, index, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 16 example cShape::/private/Points_helper.m
%   (c) 2006 Andy Register

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
        error(['Unknown helper option: ' which]);
end
%           UNCLASSIFIED
