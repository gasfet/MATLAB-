function varargout = get(this, index)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 10 example get
%   (c) 2004 Andy Register

% one argument, display info and return
if nargin == 1
    if nargout == 0
        disp(struct(this(1)));
    else
        varargout = cell(1,max([1, nargout]));
        varargout{1} = struct(this(1));
    end
    return;
end

% if index is a string, we will allow special access
called_by_name = ischar(index);

% the set switch below needs a substruct
if called_by_name
    index = substruct('.', index);
end

% public-member-variable section
found = true;  % otherwise-case will flip to false
switch index(1).subs
    case 'Size'
        if isempty(this)
            varargout = {};
        else
            varargout = {this.mSize};
        end
    case 'Points'
        if isempty(this)
            varargout = {};
        else
            varargout = {this.mPoints};
        end
    case 'ColorRgb'
        if isempty(this)
            varargout = {};
        else
            rgb = hsv2rgb([this.mColorHsv]')';
            varargout = mat2cell(rgb, 3, ones(1, size(rgb,2)));
        end
    otherwise
        found = false;  % didn't find it in the public section
end

% special/reserved member variables, not strictly public
if ~found && called_by_name
    found = true;
    switch index(1).subs
        case 'mDisplayFunc'
            if isempty(this)
                varargout = {};
            else
                varargout = {this.mDisplayFunc};
            end
        otherwise
            found = false;  % didn't find it in the special section
    end
end

if ~found
    error(['??? Reference to non-existent field ' index(1).subs '.']);
end

if length(varargout) > 1 & nargout <= 1
    if iscellstr(varargout) || any([cellfun('isempty', varargout)])
        varargout = {varargout};
    else
        try
            varargout = {[varargout{:}]};
        catch
            varargout = {varargout};
        end
    end
end