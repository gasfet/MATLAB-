function varargout = set(this, index, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 9 example set
%   (c) 2004 Andy Register

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
    case 'ColorRgb'
        if length(index) > 1
            rgb = hsv2rgb(this.mColorHsv')';
            rgb = subsasgn(rgb, index(2:end), varargin{:});
            this.mColorHsv = rgb2hsv(rgb')';
        else
            hsv = rgb2hsv([varargin{:}]')';
            hsv = mat2cell(hsv, 3, ones(1, size(hsv,2)));
            [this.mColorHsv] = deal(hsv{:});
        end
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

if ~found
    error(['??? Reference to non-existent field ' ...
        index(1).subs '.']);
end

varargout{1} = this;