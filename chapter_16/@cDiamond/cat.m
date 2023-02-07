function this = cat(varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 16 example cDiamond::cat
%   (c) 2006 Andy Register
mismatched = varargin([false ~cellfun('isclass', varargin(2:end), mfilename('class'))]);
if ~isempty(mismatched)
    error('MATLAB:UnableToConvert', ...
        ['Conversion to ' mfilename('class') ' from ' ...
        class(mismatched{1}) ' is not possible.']);
end
this = builtin(mfilename, varargin{:});
