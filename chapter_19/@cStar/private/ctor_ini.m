function [this_struct, superior, inferior, parents] = ctor_ini
% cStar::ctor initialization helper: Replace with a short note that will app ...
%           Replace with something like UNCLASSIFIED
%
% function [this_struct, superior, inferior, parents] = ctor_ini
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
% Private Member Variables
%    mTitle: Title for the figure window
%
%
%
% Chapter 19
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 08-Feb-2006 17:03:11
%

% piece-meal create to avoid object and cell problems
this_struct = struct([]);
this_struct(1).mTitle = 'A Star is born';

% Construct the parent classes, if any
parents = cell(1, 1);
parents{1} = cShape([imag(exp(j*(0:4:20)*pi/5)); real(exp(j*(0:4:20)*pi/5))]);
% Initialize parent_list
parent_list(parents{:});

% Return desired superior and inferior arguments
superior = {'double' };
inferior = {};

%           Replace with something like UNCLASSIFIED
