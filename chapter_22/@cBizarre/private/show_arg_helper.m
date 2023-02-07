function [do_sub_indexing, do_assignin, this, varargout] = show_arg_helper(which, this, index, varargin)
% cBizzare::show_arg_helper: 
%
% function [do_sub_indexing, do_assignin, this, varargout] =
%      show_arg_helper(which, this, index, varargin)
%
% Author Info
% Andy Register
% (c) 2006 Andy Register
% Chapter 22 Object-Oriented Programming in MATLAB
% A class_wizard v.3 assembled file, generated: 10-Sep-2006 10:14:16
%

switch which
    case 'get'  % ACCESSOR
        do_sub_indexing = false;  % tells get.m not to index deeper
        do_assignin = false;  % no reason to use pass-by-reference emulation
        varargout = cell(1, nargout-3); % [] return okay
        full_display(index);  % simply displays the full syntax
        if nargin > 3
            full_display(varargin);
        end
    case 'set'  % MUTATOR
        % input: index contains any additional indexing as a substruct
        % input: varargin contains values to be assigned into the object
        do_sub_indexing = false;  % always false for 'set', mutator _must_ do deep indexing
        do_assignin = false;  % leave it false until you read book section 3
        varargout = {}; % 'set' returns nothing in varargout
        full_display(index);  % simply displays the full syntax
        if nargin > 3
            full_display(varargin);
        end
    otherwise
        error('OOP:unsupportedOption', ['Unknown helper option: ' which]);
end
