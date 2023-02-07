function varargout = size(this, varargin)
% cShapeArray::size: Redefines built-in behavior.  Returns the correct ...
%
% function varargout = size(this, varargin)
%
% Description:
%     Redefines built-in behavior.  Returns the correct size array based on the
%     number of obects in the container.
%
% Member function of the class cShapeArray
%     Chapter 19
%
% Input Arguments::
%
%     this: cShapeArray: The current or "active" object
%
%     varargin: cell array: Variable-length input argument list.  see help
%          varargin
%
% Output Arguments::
%
%     varargout: cell array: Variable-length output argument list.  see help
%          varargout
%
% Chapter 19
% Copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 10-Feb-2006 09:59:40
%

varargout = cell(1, max(1,nargout));
[varargout{:}] = size(this.mArray, varargin{:});
