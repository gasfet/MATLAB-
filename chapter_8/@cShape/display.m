function display(this, display_name)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 8 example display
%   (c) 2004 Andy Register

if nargin < 2
    % assign 'ans' if inputname(1) empty
    display_name = inputname(1);
    if isempty(display_name)
        display_name = 'ans';
    end
end

% check whether mDisplayFunc has a value
% if it has a value feval the value to get the display
use_standard_view = cellfun('isempty', {this(:).mDisplayFunc});
if all(use_standard_view)
    standard_view(this, display_name);
else
    for k = 1:length(this(:))
        if use_standard_view(k)
            standard_view(this(k), display_name);
        else
            indexed_display_name = sprintf('%s(%d)', display_name, k);
            feval(this(k).mDisplayFunc, this(k), indexed_display_name);
        end
    end    
end

% --------------------------
function standard_view(this, display_name)
if ~isempty( ...
        [strfind(display_name, '.') ...
        strfind(display_name, '(') ...
        strfind(display_name, '{')])
    display_name = 'ans';
end
% handle a scalar vs array object
% note: [] this jumps to else
if length(this) == 1  % scalar case
    % assign values to a temporary struct
    public_struct.Size = this.mSize;
    public_struct.ColorRgb = ...
        subsref(this, substruct('.', 'ColorRgb'));
    % use eval to assign temp struct into display_name variable
    eval([display_name ' = public_struct;']);
    % use eval to call display on the display_name structure
    eval(['display(' display_name ');']);
else  % array case
    % use eval to assign this into display_name variable
    eval([display_name ' = this;']);
    % use eval to call builtin display for size info
    eval(['builtin(''display'', ' display_name ');']);
    % still need to display variable names explicitly
    disp('    with public member variables:');
    disp('        Size');
    disp('        ColorRgb');
    if strcmp(get(0, 'FormatSpacing'), 'loose')
        disp(' ');
    end
end

% --------------------------
function developer_view(this, display_name)
disp('-----  Public Member Variables  -----');
standard_view(this, display_name);
disp('.....  Private Member Variables  .....');
full_display(this, display_name, true);
