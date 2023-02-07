function [this_struct, superior, inferior, parents] = ctor_ini
% cBizzare::ctor initialization helper: 
%
% function [this_struct, superior, inferior, parents] = ctor_ini
%
%
%
%
% Author Info
% Andy Register
% (c) 2006 Andy Register
% Chapter 22 Object-Oriented Programming in MATLAB
% A class_wizard v.3 assembled file, generated: 10-Sep-2006 13:57:36
%

% piece-meal create to avoid object and cell problems
this_struct = struct([]);
this_struct(1).mDisplayFunc = []; % class-wizard reserved field

% Construct the parent classes, if any
parents = cell(0, 1);
% Initialize parent_list
parent_list(parents{:});

% Return desired superior and inferior arguments
superior = {};
inferior = {};
