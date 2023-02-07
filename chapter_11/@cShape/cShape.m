function this = constructor(varargin)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 11 example Constructor
%   (c) 2004 Andy Register

class_name = mfilename('class');

persistent default_this
if isempty(default_this)
    [default_this, superior, inferior] = ctor_ini;  % call /private/ctor_ini.m
    default_this = class(default_this, class_name);
    if ~isempty(superior)
        superiorto(superior{:});
    end
    if ~isempty(inferior)
        inferiorto(inferior{:});
    end
end

this = default_this;
if nargin > 0  % if not default, pass varargin to helper
    try
        this = feval(sprintf('ctor_%d', nargin), this, varargin{:});
    catch
        err = lasterror;
        switch err.identifier
            case 'MATLAB:UndefinedFunction'
                err.message = [['class ' class_name ' cannot be constructed from '] ...
                    [sprintf('%d', nargin) ' input argument(s) ']];
        end
        rethrow(err);
    end
end 