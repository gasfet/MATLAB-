function this = vertcat(varargin)
% cBizzare::vertcat: 
%
% function this = vertcat(varargin)
%
%
%
%
% Author Info
% Andy Register
% (c) 2006 Andy Register
% Chapter 22 Object-Oriented Programming in MATLAB
% A class_wizard v.3 assembled file, generated: 10-Sep-2006 13:57:36
%

mismatched = varargin(~cellfun('isclass', varargin, mfilename('class')));
if ~isempty(mismatched)
    error('MATLAB:UnableToConvert', ...
        ['Conversion to ' mfilename('class') ' from ' ...
        class(mismatched{1}) ' is not possible.']);
end

this = builtin(mfilename, varargin{:});
