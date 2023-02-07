function mat2cell(this, varargin)
% cShapeArray::mat2cell: Redefines built-in behavior.  Function is not supp...
%
% function mat2cell(this, varargin)
%
% Description:
%     Redefines built-in behavior.  Function is not supported, throws an error
%     if called.
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
% Author Info
% Copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 10-Feb-2006 09:59:40
%

error('Container:UnsupportedFunction', ...
    'mat2cell is not supported, use num2cell');
