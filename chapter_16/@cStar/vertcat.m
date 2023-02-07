function this = vertcat(varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 16 example cStar::vertcat
%   (c) 2006 Andy Register
mismatched = varargin(~cellfun('isclass', varargin, mfilename('class')));
if ~isempty(mismatched)
    error('MATLAB:UnableToConvert', ...
        ['Conversion to ' mfilename('class') ' from ' ...
        class(mismatched{1}) ' is not possible.']);
end
this = builtin(mfilename, varargin{:});
