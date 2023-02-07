function [this_struct, superior, inferior, parents] = ctor_ini
% cDiamond::ctor initialization helper: Replace with a short note that will  ...
%           Replace with something like UNCLASSIFIED
%
% function [this_struct, superior, inferior, parents] = ctor_ini
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
%
%
%
% Author Info
% Replace with your company's name
% Replace with your name
% Replace with your email address
% Replace with your phone number
% Replace with the author notes that you would like to appear just after the
% author info for every file in this class
% Replace with your standard copyright notice
% Replace this line with a string recognized by your revision control software
% A class_wizard v.3 assembled file, generated: 08-Feb-2006 17:02:00
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

%           Replace with something like UNCLASSIFIED
