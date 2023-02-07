function this = subsasgn(this, index, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 8 example subsasgn
%   (c) 2004 Andy Register

switch index(1).type

    case '.'
        switch index(1).subs
            case 'Size'
                if length(index) > 1
                    this.mSize = ...
                        subsasgn(this.mSize, index(2:end), varargin{end:-1:1});
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
                    [this.mSize] = deal(new_size{end:-1:1});
                    [this.mScale] = deal(ones(2,1));
                end
            case 'ColorRgb'
                if length(index) > 1
                    rgb = hsv2rgb(this.mColorHsv')';
                    rgb = subsasgn(rgb, index(2:end), varargin{end:-1:1});
                    this.mColorHsv = rgb2hsv(rgb')';
                else
                    hsv = rgb2hsv([varargin{end:-1:1}]')';
                    hsv = mat2cell(hsv, 3, ones(1, size(hsv,2)));
                    [this.mColorHsv] = deal(hsv{:});
                end
            case 'mDisplayFunc'
                if length(index) > 1
                    this.mDisplayFunc = ...
                        subsasgn(this.mDisplayFunc, ...
                        index(2:end), varargin{end:-1:1});
                else
                    [this.mDisplayFunc] = deal(varargin{end:-1:1});
                end

            otherwise
                error(['??? Reference to non-existent field ' index(1).subs '.']);
        end

    case '()'
        if isempty(this)
            this = cShape;
        end
        if length(index) == 1
            this = builtin('subsasgn', this, index, varargin{end:-1:1});
        else
            this_subset = this(index(1).subs{:});  % get the subset
            this_subset = subsasgn(this_subset, index(2:end), varargin{:});
            this(index(1).subs{:}) = this_subset; % put subset back
        end

    case '{}'
        error('??? cShape object, not a cell array');

    otherwise
        error(['??? Unexpected index.type of ' index(1).type]);
end