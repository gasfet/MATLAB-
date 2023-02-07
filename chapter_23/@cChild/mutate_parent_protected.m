function this = mutate_parent_protected(this, varargin)
% cChild::access_parent_protected: 
%
% function this = mutate_parent_protected(this, varargin)
%
% Chapter 23, Object-Oriented MATLAB
%
% Author Info
% Andy Register, Ph.D.
% (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 18-Sep-2006 17:22:14
%

this = pset(this, 'protected_var', varargin{:});
