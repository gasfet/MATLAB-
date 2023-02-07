function [this_struct, superior, inferior, parents] = ctor_ini
% cShapeArray::ctor initialization helper: 
%
% function [this_struct, superior, inferior, parents] = ctor_ini
%
% Chapter 19
%
% Private Member Variables
%    mArray: cell array for the container
%    mType: container can hold any object that passes isa(object, this.mType)
%    mFigHandle: Figure handle where all contained shapes are drawn
%
%
%
% Chapter 19
% Copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 10-Feb-2006 09:59:39
%

% piece-meal create to avoid object and cell problems
this_struct = struct([]);
this_struct(1).mDisplayFunc = []; % class-wizard reserved field
this_struct(1).mArray = {};
this_struct(1).mType = 'cShape';
this_struct(1).mFigHandle = [];

% Construct the parent classes, if any
parents = cell(0, 1);
% Initialize parent_list
parent_list(parents{:});

% Return desired superior and inferior arguments
superior = {'cShape' 'cStar' 'cDiamond' 'double' };
inferior = {};
