function x = mpower(varargin)
x = builtin('mpower', varargin{:});
if ~isreal(x)
    dbstack
end