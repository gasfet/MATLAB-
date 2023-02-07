function varargout = get(this, index, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 15 example cLineStyle::get
%   (c) 2006 Andy Register

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
    case 'Color'
        if isempty(this)
            varargout = {};
        else
            rgb = hsv2rgb([this.mColorHsv]')';
            varargout = mat2cell(rgb, 3, ones(1, size(rgb,2)));
        end
    case 'LineWidth'
        if isempty(this)
            varargout = {};
        else
            varargout = {this.mLineWidth};
        end
    case 'LineHandle'
        if isempty(this)
            varargout = {};
        else
            varargout = {this.mLineHandle};
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

% parent forwarding block
if ~found
        
    if called_by_name
        forward_index = index(1).subs;
    else
        forward_index = index;
    end
    
    if nargout == 0
        varargout = cell(size(this));
    else
        varargout = cell(1, nargout);
    end
    
    for parent_name = parent_list'
        try
            parent = [this.(parent_name{1})];
            [varargout{:}] = get(parent, forward_index, varargin{:});
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

% error block
if ~found
    error('MATLAB:nonExistentField', ...
        'Reference to non-existent field identifier %s', ...
        index(1).subs);
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