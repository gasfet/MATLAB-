function [this_struct, superior, inferior, parents] = ctor_ini
% cDiamond::ctor initialization helper: 
%
% function [this_struct, superior, inferior, parents] = ctor_ini
%
%
%
%
% Author Info
% Chapter 20
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 17-Jun-2006 14:20:27
%

% piece-meal create to avoid object and cell problems
this_struct = struct([]);

% Construct the parent classes, if any
parents = cell(1, 1);
parents{1} = cShape([-1 0 1 0 -1; 0 -1 0 1 0]);
% Initialize parent_list
parent_list(parents{:});

% Return desired superior and inferior arguments
superior = {'double' };
inferior = {};
