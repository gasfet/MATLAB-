function [this, superior, inferior, parents] = ctor_ini
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 16 example cStar::/private/ini.m
%   (c) 2004 Andy Register

% piece-meal create to avoid object and cell problems
this = struct([]);
this(1).mTitle = 'A Star is born'; 

superior = {'double'};
inferior = {};

parents{1} = cShape([imag(exp(j*(0:4:20)*pi/5)); real(exp(j*(0:4:20)*pi/5))]);
parent_list(parents{:});