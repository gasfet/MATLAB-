function [do_sub_indexing, do_assignin, this, varargout] = Points_helper(which, this, index, varargin)
%POINTS_HELPER for class cShape, Replace with a short note that will appear on
%              the H1 line along with each function description
%
%           Replace with something like UNCLASSIFIED
%
% function [do_sub_indexing, do_assignin, this, varargout] =
%      Points_helper(which, this, index, varargin)
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
% Author Info:
% Replace with your company's name
% Replace with your name
% Replace with your email address
% Replace with your phone number
% Replace with the author notes that you would like to appear just after the
% author info for every file in this class
% Replace with your standard copyright notice
% Replace this line with a string recognized by your revision control software
% A class_wizard v 3.0 assembled file, generated: 26-Sep-2006 10:21:46
%

switch which
    case 'get'  % ACCESSOR
        % input: index contains any additional indexing as a substruct
        % input: varargin empty for accessor
        do_sub_indexing = true;  % tells get.m whether to index deeper
        do_assignin = false;  % leave it false until you read book section 3
        varargout = cell(1, nargout-3); % -3 due to 3 known vars plus varargout
        % \/  \/  \/  \/
        % YOUR 'GET/ACCESSOR' HELPER CODE GOES HERE
        % e.g., [varargout{:}] = {function of public and private vars of this};
        warning('OOP:incompleteFunction', 'The function definition is incomplete');
        % /\  /\  /\  /\
    case 'set'  % MUTATOR
        % input: index contains any additional indexing as a substruct
        % input: varargin contains values to be assigned into the object
        do_sub_indexing = false;  % always false for 'set', mutator _must_ do deep indexing
        do_assignin = false;  % leave it false until you read book section 3
        varargout = {}; % 'set' returns nothing in varargout
        % \/  \/  \/  \/
        % YOUR 'SET/MUTATOR' HELPER CODE GOES HERE
        warning('OOP:incompleteFunction', 'The function definition is incomplete');
        % below is a code template that might be a convenient starting point
        % if isempty(index) % No deeper indexing requested, assign the input values
        %     [this.Points] = deal(varargin{:});
        % else  % deeper indexing requested, use subsasgn to do it
        %     Points = [this.Points];  % Modify the assignment
        %     Points = subsasgn(Points, index, varargin{:});
        %     [this.Points] = Points;
        % end
        % /\  /\  /\  /\
    otherwise
        error('OOP:unsupportedOption', ['Unknown helper option: ' which]);
end
%           Replace with something like UNCLASSIFIED
