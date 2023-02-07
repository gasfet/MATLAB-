function handle = fc_handle(this)
% fc_handle returns a function handle to the main function class function
% Note that MATLAB makes a copy of this and inserts the copy into the
% handle.  Thus the private member variables used when eval'ing the handle are fixed.
%
% function handle = fc_handle(this)
%
% Author Info
% Andy Register, Ph.D.
% (c) 2006 Andy Register
% Object-Oriented Programming in MATLAB, Chapter 22
%

% handle = @(x)this(x); % does not work here because we are inside a member
% function and this(x) returns the built-in function that indexes this.
% Remember, when you are inside a member function the normal rules about
% selecting the tailored function are suspended for subsref and subsasgn.

handle = @(x)subsref(this, substruct('()', {x}));
