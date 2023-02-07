function varargout = set(this, index, varargin)
%SET for class cStar, Replace with a short note that will appear on the H1 line
%    along with each function description
%
%           Replace with something like UNCLASSIFIED
%
% function varargout = set(this, index, varargin)
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
% Public Member Variables
%    Title: string: A title for the figure window
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
% A class_wizard v 3.0 assembled file, generated: 26-Sep-2006 10:22:06
%

do_assignin = false;  % special variable, see book section 3

% one argument, display info and return
if nargin < 3
    possible = fieldnames(this, '-possible');
    possible_struct = struct(possible{:});
    if nargout == 0
        if nargin == 1
            disp(possible_struct);
        else
            try
                temp_struct.(index) = possible_struct.(index);
                disp(temp_struct);
            catch
                warning('MATLAB:nonExistentField', ... 
                ['??? Reference to non-existent field ' index '.']);
            end
        end
    else
        varargout = cell(1,max([1, nargout]));
        varargout{1} = possible_struct;
    end
    return;
end

called_by_name = ischar(index);

% the set switch below needs a substruct
if called_by_name
    index = struct('type', '.', 'subs', index);
end

% public-member-variable section
found = true;  % otherwise-case will flip to false
switch index(1).subs
    case 'Title'
            [dummy, do_assignin, this] = ...
                Title_helper('set', this, index(2:end), varargin{:});
    otherwise
        found = false;
end

% concealed member variables, not strictly public
if ~found && called_by_name
    found = true;
    switch index(1).subs
        otherwise
            found = false;  % didn't find it in the concealed section
    end
end

% parent forwarding block
if ~found
        
    if called_by_name
        forward_index = index(1).subs;
    else
        forward_index = index;
    end
    
    for parent_name = parent_list'
        try
            parent = set([this.(parent_name{1})], forward_index, varargin{:});
            parent = num2cell(parent);
            [this.(parent_name{1})] = deal(parent{:});
            found = true;  % catch will assign false if not found
            break;  % can only get here if field is found
        catch
            found = false;
            err = lasterror;
            switch err.identifier
                case 'MATLAB:nonExistentField'
                    % NOP
                otherwise
                    rethrow(err);
            end
        end
    end
end

if ~found
    error('MATLAB:nonExistentField', ...
        'Reference to non-existent field identifier %s', ...
        index(1).subs);
end

varargout{1} = this;
%           Replace with something like UNCLASSIFIED
