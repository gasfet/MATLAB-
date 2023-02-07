function this = horzcat(varargin)
% cParent::horzcat: 
%
% function this = horzcat(varargin)
%
% Chapter 23, Object-Oriented MATLAB
%
%
%
%
% Author Info
% Andy Register, Ph.D.
% (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 18-Sep-2006 17:23:58
%

mismatched = varargin(~cellfun('isclass', varargin, mfilename('class')));
if ~isempty(mismatched)
    error('MATLAB:UnableToConvert', ...
        ['Conversion to ' mfilename('class') ' from ' ...
        class(mismatched{1}) ' is not possible.']);
end

this = builtin(mfilename, varargin{:});
