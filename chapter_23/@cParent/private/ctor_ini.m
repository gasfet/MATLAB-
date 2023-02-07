function [this_struct, superior, inferior, parents] = ctor_ini
% cParent::ctor initialization helper: 
%
% function [this_struct, superior, inferior, parents] = ctor_ini
%
% Chapter 23, Object-Oriented MATLAB
%
% Private Member Variables
%    m_parent_func_array: Holds the function handles for parent classes
%    m_protected_var: Example protected variable.
%
%
%
% Author Info
% Andy Register, Ph.D.
% (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 18-Sep-2006 17:23:58
%

% piece-meal create to avoid object and cell problems
this_struct = struct([]);
this_struct(1).mDisplayFunc = []; % class-wizard reserved field
this_struct(1).m_protected_func_array = {@protected_function};
this_struct(1).m_protected_var = NaN;

% Construct the parent classes, if any
parents = cell(0, 1);
% Initialize parent_list
parent_list(parents{:});

% Return desired superior and inferior arguments
superior = {};
inferior = {};
