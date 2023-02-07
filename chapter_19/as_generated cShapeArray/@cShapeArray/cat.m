function this = cat(varargin)
% cShapeArray::cat: 
%
% function this = cat(varargin)
%
% Chapter 19
%
%
%
%
% Author Info
% Copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 11-Feb-2006 10:58:20
%

mismatched = varargin([false ~cellfun('isclass', varargin(2:end), mfilename('class'))]);
if ~isempty(mismatched)
    error('MATLAB:UnableToConvert', ...
        ['Conversion to ' mfilename('class') ' from ' ...
        class(mismatched{1}) ' is not possible.']);
end

this = builtin(mfilename, varargin{:});
