function container_cells = num2cell(this, varargin)
% cShapeArray::num2cell: Redefines built-in behavior.  Use this function to...
%
% function container_cells = num2cell(this, varargin)
%
% Description:
%     Redefines built-in behavior.  Use this function to access the container's
%     entire cell array.  Function only supports  one input argument.  If you
%     try to pass in a direction, the function will throw an error.
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
%     container_cells: cell array of objects: cell array of objects held in the
%          container
%
% Author Info
% Copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 10-Feb-2006 09:59:40
%

% \/  \/  \/  \/
% temporarily take care of outputs so code does not bomb if called
container_cells = [];
% Your Code Goes Here
warning('OOP:incompleteFunction', 'The function definition is incomplete');
% /\  /\  /\  /\
