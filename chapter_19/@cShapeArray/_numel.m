function num = numel(this, varargin)
% cShapeArray::numel: Redefines built-in behavior.  Returns the correct ...
%
% function num = numel(this, varargin)
%
% Description:
%     Redefines built-in behavior.  Returns the correct numel value based on
%     the number of obects in the container.
%
% Member function of the class cShapeArray
%     Chapter 19
%
% Input Arguments::
%
%     this: cShapeArray: The current or "active" object
%
%     varargin: cell array: Variable-length input argument list.  see help
%          varargin
%
% Output Arguments::
%
%     num: integer >= 0: Used to return integer values associated with
%          functions like length, end, etc.
%
% Chapter 19
% Copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 10-Feb-2006 09:59:40
%

num = numel(this.mArray, varargin{:});
