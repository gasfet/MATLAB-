function varargout = subsref(this, index)
% cPolyFun::subsref: 
%
% function varargout = subsref(this, index)
%
%
% Public Member Variables
%    coef: length-N matrix of doubles: Used to hold polynomial coefficients for
%        the expression, a(1) + a(2)*x^2 + a(3)*x^3 + ...
%
%
% Author Info
% Andy Register, Ph.D.
% (c) 2006 Andy Register
% Object-Oriented Programming in MATLAB, Chapter 22
% A class_wizard v.3 assembled file, generated: 13-Sep-2006 16:21:39
%

do_assignin = false; % special variable, see book section 3

switch index(1).type

  case '.'
    if isempty(this)
        varargout = cell(0);
    else
        varargout = cell(1, max(length(this(:)), nargout));
    end
    try
        [varargout{:}] = get(this, index);
    catch
        rethrow(lasterror);
    end

    case '()'
        if numel(index) > 1 || numel(index.subs) > 1
            error('cPolyFun:invalidInput', 'Only one input argument is allowed');
        end
        x = reshape(index.subs{1}, [], 1);  % x is a col
        coef = repmat(this.m_coef(:)', numel(x), 1);
        power = repmat((0:numel(this.m_coef)-1), numel(x), 1);
        x = repmat(x, 1, size(coef, 2));
        varargout = {reshape(sum(coef .* x.^power, 2), size(index.subs{1}))};

    case '{}'
      error('OOP:unsupportedOption', ...
            ['??? ' class(this) ' object, is not a cell array']);

    otherwise
        error('OOP:unexpectedIndex', ...
             ['??? Unexpected index.type of ' index(1).type]);
end

if do_assignin % subsref used in special way, see book section 3
    var_name = inputname(1);
    if isempty(var_name)
        warning('OOP:invalidInputname', ...
            'No assignment: pass-by-reference can only be used on non-indexed objects');
    else
        assignin('caller', var_name, this);
        caller = evalin('caller', 'mfilename');
        if ~isempty(strmatch(caller, {'subsref' 'subsasgn' 'get' 'set'}))
            assignin('caller', 'do_assignin', true);
        end
    end
end

if length(varargout) > 1 && nargout <= 1
    if iscellstr(varargout) || any(cellfun('isempty', varargout))
        varargout = {varargout};
    else
        try
            varargout = {[varargout{:}]};
        catch
            varargout = {varargout};
        end
    end
end
