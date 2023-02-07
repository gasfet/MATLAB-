function value = access_parent_protected(this)
% cChild::access_parent_protected: 
%
% function access_parent_protected(this)
%
% Chapter 23, Object-Oriented MATLAB
%
% Author Info
% Andy Register, Ph.D.
% (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 18-Sep-2006 17:22:14
%

value = pget(this, 'protected_var');
