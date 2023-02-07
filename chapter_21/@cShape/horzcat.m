function this = horzcat(varargin)
% cShape::horzcat: 
%
% function this = horzcat(varargin)
%
%
%
%
% Author Info
% Chapter 21
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 26-Jun-2006 23:54:06
%

mismatched = varargin(~cellfun('isclass', varargin, mfilename('class')));
if ~isempty(mismatched)
    error('MATLAB:UnableToConvert', ...
        ['Conversion to ' mfilename('class') ' from ' ...
        class(mismatched{1}) ' is not possible.']);
end

this = builtin(mfilename, varargin{:});
