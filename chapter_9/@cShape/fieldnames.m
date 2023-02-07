function names = fieldnames(this, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 9 example fieldnames
%   (c) 2004 Andy Register

% returns the list of public member variable names
if nargin == 1
    names = {'Size' 'ColorRgb'}'; % note: return as a column
else
    switch varargin{1}
    case '-full'
        names = {'Size % double array' ...
                 'ColorRgb % double array'}';
    case '-possible'
        names = {'Size' {{'double array (2x1)'}} ...
                 'ColorRgb' {{'double array  (3x1)'}}}';
    otherwise
        error('Unsupported call to fieldnames');
    end
end