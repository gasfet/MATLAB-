function num = end(this, k, n)
% cShapeArray::end: Redefines built-in behavior.  Returns an index val...
%
% function num = end(this, k, n)
%
% Description:
%     Redefines built-in behavior.  Returns an index value consistent with
%     "end".  If n is not equal to length(size(this.mObject)) some reshaping is
%     done to find the correct value.
%
% Member function of the class cShapeArray
%     Chapter 19
%
% Input Arguments::
%
%     this: cShapeArray: The current or "active" object
%
%     k: integer > 0: specifies which dimension to inspect
%
%     n: integer > 0: Total number of dimensions
%
% Output Arguments::
%
%     num: integer >= 0: Used to return integer values associated with
%          functions like length, end, etc.
%
% Author Info
% Copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 10-Feb-2006 09:59:40
%

% \/  \/  \/  \/
% temporarily take care of outputs so code does not bomb if called
num = [];
% Your Code Goes Here
warning('OOP:incompleteFunction', 'The function definition is incomplete');
% /\  /\  /\  /\
