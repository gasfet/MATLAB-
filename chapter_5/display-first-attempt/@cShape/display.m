function display(this)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 5 first-attempt example display
%   (c) 2004 Andy Register

% assign values to a temporary struct
public_struct.Size = this.mSize;
public_struct.ColorRgb = subsref(this, substruct('.', 'ColorRgb'));
% use disp and inputname for the display header
disp([inputname(1) ' =']);
% use disp and the temporary structure
disp(public_struct);