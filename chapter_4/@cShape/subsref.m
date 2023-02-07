function varargout = subsref(this, index)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 4 example subsref
%   (c) 2004 Andy Register

switch index(1).type

    case '.'
        switch index(1).subs
            case 'Size'
                if isempty(this)
                    varargout = {};
                else
                    varargout = {this.mSize};
                end
            case 'ColorRgb'
                if isempty(this)
                    varargout = {};
                else
                    rgb = hsv2rgb([this.mColorHsv]')';
                    varargout = mat2cell(rgb, 3, ones(1, size(rgb,2)));
                end
            otherwise
                error(['??? Reference to non-existent field ' index(1).subs '.']);
        end

        if length(index) > 1
            if length(this(:)) == 1
                varargout = {subsref([varargout{:}], index(2:end))};
            else
                [err_id, err_msg] = array_reference_error(index(2).type);
                error(err_id, err_msg);
            end
        end

    case '()'
        this_subset = this(index(1).subs{:});
        if length(index) == 1
            varargout = {this_subset};
        else
            % trick subsref into returning more than 1 ans
            varargout = cell(size(this_subset));
            [varargout{:}] = subsref(this_subset, index(2:end));
        end

    case '{}'
        error('??? cShape object, not a cell array');

    otherwise
        error(['??? Unexpected index.type of ' index(1).type]);
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