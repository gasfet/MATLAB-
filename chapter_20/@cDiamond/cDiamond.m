function this = constructor(varargin)
% cDiamond::constructor: 
%
% function this = constructor(varargin)
%
%
%
%
% Author Info
% Chapter 20
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 17-Jun-2006 14:20:27
%

class_name = mfilename('class');

persistent default_this
if isempty(default_this)
    [default_struct, superior, inferior, parents] = ctor_ini;  % call /private/ctor_ini.m
    default_this = class(default_struct, class_name, parents{:});

    if ~isempty(superior)
        superiorto(superior{:});
    end
    if ~isempty(inferior)
        inferiorto(inferior{:});
    end
end
this = default_this;
if nargin > 0  % if default nothing else to do otherwise pass varargin to helper
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
