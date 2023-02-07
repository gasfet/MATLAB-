function this = vertcat(varargin)
%VERTCAT for class cLineStyle, Replace with a short note that will appear on
%        the H1 line along with each function description
%
%           Replace with something like UNCLASSIFIED
%
% function this = vertcat(varargin)
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
% Author Info:
% Replace with your company's name
% Replace with your name
% Replace with your email address
% Replace with your phone number
% Replace with the author notes that you would like to appear just after the
% author info for every file in this class
% Replace with your standard copyright notice
% Replace this line with a string recognized by your revision control software
% A class_wizard v 3.0 assembled file, generated: 26-Sep-2006 10:23:00
%

mismatched = varargin(~cellfun('isclass', varargin, mfilename('class')));
if ~isempty(mismatched)
    error('MATLAB:UnableToConvert', ...
        ['Conversion to ' mfilename('class') ' from ' ...
        class(mismatched{1}) ' is not possible.']);
end

this = builtin(mfilename, varargin{:});
%           Replace with something like UNCLASSIFIED
