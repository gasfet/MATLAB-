function names = fieldnames(this, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 11 example fieldnames
%   (c) 2004 Andy Register

% returns the list of public member variable names
if nargin == 1
    names = {'Size' 'ColorRgb' 'Points'}'; % note: return as a column
else
    switch varargin{1}
    case '-full'
        names = {'Size % double array' ...
                 'ColorRgb % double array' ...
                 'Points % double array'}';
    case '-possible'
        names = {'Size' {{'double array (2x1)'}} ...
                 'ColorRgb' {{'double array  (3x1)'}} ...
                 'Points' {{'double array  (2xN)'}}}';
    otherwise
        error('Unsupported call to fieldnames');
    end
end