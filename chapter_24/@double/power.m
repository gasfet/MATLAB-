function x = power(varargin)
x = builtin('power', varargin{:});
if ~isreal(x)
    dbstack
end