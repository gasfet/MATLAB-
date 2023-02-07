function varargout = set(this, index, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 15 example cLineStyle::set
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
    case 'Color'
        if length(index) > 1
            rgb = hsv2rgb(this.mColorHsv')';
            rgb = subsasgn(rgb, index(2:end), varargin{:});
            this.mColorHsv = rgb2hsv(rgb')';
        else
            hsv = rgb2hsv([varargin{:}]')';
            hsv = mat2cell(hsv, 3, ones(1, size(hsv,2)));
            [this.mColorHsv] = deal(hsv{:});
        end
        for k = 1:length(this(:))
            try
                set(this(k).mLineHandle, 'Color', get(this(k), 'Color'));
            end
        end
        
    case 'LineWidth'
        if length(index) > 1
            error([index(1).subs ' does not support indexing']);
        end
        if any([varargin{:}] < 1)
            error([index(1).subs ' values must be >= 1']);
        end
        if length(varargin) ~= 1 && length(varargin) ~= length(this(:))
            error([index(1).subs ' input must be length == 1 or length == the array size']);
        end
        [this.mLineWidth] = deal(varargin{:});
        for k = 1:length(this(:))
            try
                set(this(k).mLineHandle, 'LineWidth', get(this(k), 'LineWidth'));
            end
        end
        
    case 'LineHandle'
        if length(index) > 1
            error([index(1).subs ' does not support indexing']);
        end
        if length(varargin) ~= 1 && length(varargin) ~= length(this(:))
            error([index(1).subs ' input must be length == 1 or length == the array size']);
        end
        [this.mLineHandle] = deal(varargin{:});
        
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