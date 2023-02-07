function [this_struct, superior, inferior, parents] = ctor_ini
% cPolyFun::ctor initialization helper: 
%
% function [this_struct, superior, inferior, parents] = ctor_ini
%
% Private Member Variables
%    m_coef: Polynomial coefficients used to return a value for function class
%        function
%
%
%
% Author Info
% Andy Register, Ph.D.
% (c) 2006 Andy Register
% Object-Oriented Programming in MATLAB, Chapter 22
% A class_wizard v.3 assembled file, generated: 13-Sep-2006 16:21:39
%

% piece-meal create to avoid object and cell problems
this_struct = struct([]);
this_struct(1).mDisplayFunc = []; % class-wizard reserved field
this_struct(1).m_coef = zeros(1,0);

% Construct the parent classes, if any
parents = cell(0, 1);
% Initialize parent_list
parent_list(parents{:});

% Return desired superior and inferior arguments
superior = {};
inferior = {};
