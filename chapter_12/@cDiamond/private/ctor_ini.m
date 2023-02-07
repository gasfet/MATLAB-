function [this, superior, inferior, parents] = ctor_ini
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 12 example cDiamond::/private/ini.m
%   (c) 2004 Andy Register

% piece-meal create to avoid object and cell problems
this = struct([]);

superior = {'double'};
inferior = {};

parents{1} = cShape([-1 0 1 0 -1; 0 -1 0 1 0]);
parent_list(parents{:});