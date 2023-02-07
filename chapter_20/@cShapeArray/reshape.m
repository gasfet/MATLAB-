function this = reshape(this, varargin)
% cShapeArray::reshape: Redefines built-in behavior.  Reshapes the object ...
%
% function this = reshape(this, varargin)
%
% Description:
%     Redefines built-in behavior.  Reshapes the object cell array.
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
%     this: cShapeArray: The current or "active" object
%
% Chapter 19
% Copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 11-Feb-2006 10:58:20
%

this.mArray = reshape(this.mArray, varargin{:});
