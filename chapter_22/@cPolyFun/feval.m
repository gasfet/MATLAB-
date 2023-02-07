function varargout = feval(this, varargin)
% feval treats the class almost as if it were a function handle
%
% function varargout = feval(this, varargin)
%
% Author Info
% Andy Register, Ph.D.
% (c) 2006 Andy Register
% Object-Oriented Programming in MATLAB, Chapter 22
%

varargout = cell(1, max([1 nargout]));
[varargout{:}] = subsref(this, substruct('()', varargin));
