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
% Chapter 19
% Copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 10-Feb-2006 09:59:40
%

array_size = size(this.mArray);
n_size = [array_size(1:n-1) prod(array_size(n:end))];
num = n_size(k);

