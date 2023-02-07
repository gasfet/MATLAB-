function display(this)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 5 improved example display
%   (c) 2004 Andy Register

% handle empty inputname
display_name = inputname(1);
if isempty(display_name)
    display_name = 'ans';
end

% handle scalar vs vector this
% note: this can never be []
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