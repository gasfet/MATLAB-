function this = cat(varargin)
% cParent::cat: 
%
% function this = cat(varargin)
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

mismatched = varargin([false ~cellfun('isclass', varargin(2:end), mfilename('class'))]);
if ~isempty(mismatched)
    error('MATLAB:UnableToConvert', ...
        ['Conversion to ' mfilename('class') ' from ' ...
        class(mismatched{1}) ' is not possible.']);
end

this = builtin(mfilename, varargin{:});
