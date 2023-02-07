function varargout = set(this, index, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 15 example cShape::set
%   (c) 2006 Andy Register

% one argument, display info and return
if nargin < 3
    possible = fieldnames(this, '-possible');
    possible_struct = struct(possible{:});
    if nargout == 0
        if nargin == 1
            disp(possible_struct);
        else
            try
                temp_struct.(index) = possible_struct.(index);
                disp(temp_struct);
            catch
                warning(['??? Reference to non-existent field ' ...
                    index '.']);
            end
        end
    else
        varargout = cell(1,max([1, nargout]));
        varargout{1} = possible_struct;
    end
    return;
end

called_by_name = ischar(index);

% the set switch below needs a substruct
if called_by_name
    index = substruct('.', index);
end

% public-member-variable section
found = true;  % otherwise-case will flip to false
switch index(1).subs
    case 'Size'
        if length(index) > 1
            this.mSize = ...
                subsasgn(this.mSize, index(2:end), varargin{:});
            this.mScale = subsasgn(this.mScale, index(2:end), 1);
        else
            new_size = zeros(2, length(varargin));
            for k = 1:size(new_size, 2)
                try
                    new_size(:, k) = varargin{k}(:);
                catch
                    error('Size must be a scalar or length == 2');
                end
            end
            new_size = num2cell(new_size, 1);
            [this.mSize] = deal(new_size{:});
            [this.mScale] = deal(ones(2,1));
        end
        for k = 1:length(this(:))
            points = get(this(k), 'Points');
            try
                set(this(k).mLineStyle.LineHandle, ...
                    'XData', this.mSize(1) * points(1,:), ...
                    'YData', this.mSize(2) * points(2,:));
            end
        end
        
    case 'Points'
        if length(index) > 1
            error('The entire Points array must be assigned at one time');
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
        
    case 'ColorRgb'
        index(1).subs = 'Color';
        line_style = set([this.mLineStyle], index, varargin{:});
        line_style = num2cell(line_style);
        [this.mLineStyle] = deal(line_style{:});
        
    case 'LineWeight'
        if length(index) > 1
            error([index(1).subs ' does not support indexing']);
        end
        if length(varargin) ~= 1 && length(varargin) ~= length(this(:))
            error([index(1).subs ' incorrect input size']);
        end
        normal_sieve = strcmp(varargin, 'normal');
        bold_sieve   = strcmp(varargin, 'bold');
        if ~all(normal_sieve | bold_sieve)
            error([index(1).subs ' input values not ''normal'' or ''bold''']);
        end
        varargin(normal_sieve) = {1};
        varargin(bold_sieve)   = {3};
        index(1).subs = 'LineWidth';
        line_style = set([this.mLineStyle], index, varargin{:});
        line_style = num2cell(line_style);
        [this.mLineStyle] = deal(line_style{:});
        
    otherwise
        found = false;
end

% concealed member variables, not strictly public
if ~found && called_by_name
    found = true;
    switch index(1).subs
        case 'mDisplayFunc'
            if length(index) > 1
                this.mDisplayFunc = ...
                    subsasgn(this.mDisplayFunc, ...
                    index(2:end), varargin{:});
            else
                [this.mDisplayFunc] = deal(varargin{:});
            end
        otherwise
            found = false;  % didn't find it in the special section
    end
end

% parent forwarding block
if ~found
        
    if called_by_name
        forward_index = index(1).subs;
    else
        forward_index = index;
    end
    
    for parent_name = parent_list'
        try
            parent = set([this.(parent_name{1})], forward_index, varargin{:});
            parent = num2cell(parent);
            [this.(parent_name{1})] = deal(parent{:});
            found = true;  % catch will assign false if not found
            break;  % can only get here if field is found
        catch
            found = false;
            err = lasterror;
            switch err.identifier
                case 'MATLAB:nonExistentField'
                    % NOP
                otherwise
                    rethrow(err);
            end
        end
    end
end

if ~found
    error('MATLAB:nonExistentField', ...
        'Reference to non-existent field identifier %s', ...
        index(1).subs);
end

varargout{1} = this;