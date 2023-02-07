function [this_struct, superior, inferior, parents] = ctor_ini
% cChild::ctor initialization helper: 
%
% function [this_struct, superior, inferior, parents] = ctor_ini
%
% Chapter 23, Object-Oriented MATLAB
%
% Private Member Variables
%    m_protected_func_array: Holds the array of protected functions
%
%
%
% Author Info
% Andy Register, Ph.D.
% (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 18-Sep-2006 17:22:14
%

% piece-meal create to avoid object and cell problems
this_struct = struct([]);
this_struct(1).m_protected_func_array = {};

% Construct the parent classes, if any
parents = cell(1, 1);
handles = cell(1, 1);
[parents{1}, handles{1}] = cParent();
% Initialize parent_list
parent_list(parents{:});
% Initialize m_protected_func_array
this_struct(1).m_protected_func_array = vertcat(handles{:});

% Return desired superior and inferior arguments
superior = {};
inferior = {};
