function names = fieldnames(this, varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 16 example cLineStyle::fieldnames
%   (c) 2006 Andy Register
names = {};
% first fill up names with parent public names
parent_name = parent_list;  % get the parent name cellstr
for parent_name = parent_list'
    names = [names; fieldnames([this.(parent_name{1})], varargin{:})];
end
% returns the list of public member variable names
if nargin == 1
    names = {'Color' 'LineWidth' 'LineHandle'}'; % note: return as a column
else
    switch varargin{1}
    case '-full'
        names = {'Color % double array' ...
                 'LineWidth % positive integer' ...
                 'LineHandle % plot handle'}';
    case '-possible'
        names = {'Color' {{'double array  (3x1)'}} ...
                 'LineWidth' {{'positive integer'}} ...
                 'LineHandle' {{'plot handle'}}}';
    otherwise
        error('OOP:unsupportedOption', 'Unsupported call to fieldnames');
    end
end
