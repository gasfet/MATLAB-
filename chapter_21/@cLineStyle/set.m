function varargout = set(this, index, varargin)
% cLineStyle::set: 
%
% function varargout = set(this, index, varargin)
%
%
% Public Member Variables
%    Color: 3x1 array: RGB Line Color
%    LineWidth: integer > 0:
%    LineHandle: graphics handle: public graphics handle to the line plot
%    LineWidthCounter: double array: public interface to static value
%
%
% Author Info
% Chapter 20
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 17-Jun-2006 14:20:43
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
    case 'Color'
            [dummy, do_assignin, this] = ...
                Color_helper('set', this, index(2:end), varargin{:});
    case 'LineWidth'
            [dummy, do_assignin, this] = ...
                LineWidth_helper('set', this, index(2:end), varargin{:});
    case 'LineHandle'
        if length(index) > 1
            if length(this(:)) == 1
                this.mLineHandle = ...
                    subsasgn(this.mLineHandle, ...
                    index(2:end), varargin{:});
            else
                [err_id, err_msg] = array_reference_error(index(2).type);
                error(err_id, err_msg);
            end
        else
            [this.mLineHandle] = deal(varargin{:});
        end
    case 'LineWidthCounter'
        static_this = static;  % read
        if length(index) > 1
            if length(this(:)) == 1
                static_this.mLineWidthCounter = ...
                    subsasgn(static_this.mLineWidthCounter, ...
                    index(2:end), varargin{end}); % modify
            else
                [err_id, err_msg] = array_reference_error(index(2).type);
                error(err_id, err_msg);
            end
        else
            [static_this.mLineWidthCounter] = varargin{end};
        end
        static(static_this);  % write
    otherwise
        found = false;
end

% concealed member variables, not strictly public
if ~found && called_by_name
    found = true;
    switch index(1).subs
            case 'mDisplayFunc' % class-wizard reserved field
                if length(index) > 1
                   error('OOP:indexLimit', 'No further indexing allowed')
                else
                   [this.mDisplayFunc] = deal(varargin{:});
                end
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
