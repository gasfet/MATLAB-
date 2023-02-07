function static_this = static(static_this)
% cShapeArray::static: 
%
% function static_this = static(static_this)
%
%
%
%
% Chapter 20
% Chapter 20
% Copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 24-Feb-2006 19:44:17
%

persistent static_var
if nargin == 1
    static_var = static_this;
else
    static_this = static_var;
end
