function [do_sub_indexing, do_assignin, this, varargout] = View_helper(which, this, index, varargin)
% cShape::View_helper: 
%
% function [do_sub_indexing, do_assignin, this, varargout] = View_helper(which,
%      this, index, varargin)
%
% Author Info
% Chapter 21
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 26-Jun-2006 23:54:06
%

switch which
    case 'get'  % ACCESSOR
        % input: index contains any additional indexing as a substruct
        % input: varargin empty for accessor
        do_sub_indexing = true;  % tells get.m whether to index deeper
        do_assignin = true;  % !!! call-by-reference behavior
        varargout = cell(1, nargout-3); % -3 due to 3 known vars plus varargout
        
        % before the toggle [] means standard, load after-toggle values 
        developer_sieve = cellfun('isempty', {this.mDisplayFunc});
        % toggle the display function, remember false means standard
        [this(developer_sieve).mDisplayFunc] = deal('developer_view');
        [this(~developer_sieve).mDisplayFunc] = deal([]);
        
        % fill varargout with the "requested" data
        varargout = num2cell(developer_sieve);
        
    case 'set'  % MUTATOR
        % input: index contains any additional indexing as a substruct
        % input: varargin contains values to be assigned into the object
        do_sub_indexing = false;  % always false for 'set', mutator _must_ do deep indexing
        do_assignin = false;  % leave it false until you read book section 3
        varargout = {}; % 'set' returns nothing in varargout
        
        if ~isempty(index)
            error('Deeper levels of indexing are not supported');
        end
        developer_sieve = logical([varargin{:}]); 
        % toggle the display function
        [this(developer_sieve).mDisplayFunc] = deal('developer_view');
        [this(~developer_sieve).mDisplayFunc] = deal([]);
        
    otherwise
        error('OOP:unsupportedOption', ['Unknown helper option: ' which]);
end
