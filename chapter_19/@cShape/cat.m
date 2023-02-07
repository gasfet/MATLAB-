function this = cat(varargin)
% cShape::cat: Replace with a short note that will appear on the H1 line alo ...
%           Replace with something like UNCLASSIFIED
%
% function this = cat(varargin)
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
%
%
%
% Chapter 19
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 08-Feb-2006 17:02:23
%

mismatched = varargin([false ~cellfun('isclass', varargin(2:end), mfilename('class'))]);
if ~isempty(mismatched)
    error('MATLAB:UnableToConvert', ...
        ['Conversion to ' mfilename('class') ' from ' ...
        class(mismatched{1}) ' is not possible.']);
end

this = builtin(mfilename, varargin{:});
%           Replace with something like UNCLASSIFIED
