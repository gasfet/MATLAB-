function names = fieldnames(this, varargin)
% cPolyFun::fieldnames: 
%
% function names = fieldnames(this, varargin)
%
%
% Public Member Variables
%    coef: length-N matrix of doubles: Used to hold polynomial coefficients for
%        the expression, a(1) + a(2)*x^2 + a(3)*x^3 + ...
%
%
% Author Info
% Andy Register, Ph.D.
% (c) 2006 Andy Register
% Object-Oriented Programming in MATLAB, Chapter 22
% A class_wizard v.3 assembled file, generated: 13-Sep-2006 16:21:39
%

names = {};

% first fill up names with parent public names
parent_name = parent_list;  % get the parent name cellstr
for parent_name = parent_list'
    names = [names; fieldnames(feval(parent_name{1}), varargin{:})];
end

% then add additional names for child
% note: return names as a column
% note: names in the list must be unique and unique also sorts
if nargin == 1
    names = [names; {'coef'}'];
    names = unique(names);
else
    switch varargin{1}
    case '-full'
        names = [names; { ...
                 'coef % length-N matrix of doubles' ... 
             }'];
    case '-possible'
        names = [names; { ...
                 'coef' {{'length-N matrix of doubles'}} ...
             }'];
    otherwise
        error('OOP:unsupportedOption', 'Unsupported call to fieldnames');
    end
end
