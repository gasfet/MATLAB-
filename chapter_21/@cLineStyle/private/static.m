function static_this = static(static_this)
% cLineStyle::static: 
%
% function static_this = static(static_this)
%
%
%
%
% Author Info
% Chapter 20
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 17-Jun-2006 14:20:43
%

persistent static_var
if nargin == 1
    static_var = static_this;
else
    static_this = static_var;
end
