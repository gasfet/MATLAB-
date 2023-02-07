function num = length(this)
% cShapeArray::length: Redefines built-in behavior.  Returns the correct ...
%
% function num = length(this)
%
% Description:
%     Redefines built-in behavior.  Returns the correct length based on the
%     number of obects in the container.
%
% Member function of the class cShapeArray
%     Chapter 19
%
% Input Arguments::
%
%     this: cShapeArray: The current or "active" object
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

num = length(this.mArray);
