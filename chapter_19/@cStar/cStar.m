function this = constructor(varargin)
% cStar::constructor: Replace with a short note that will appear on the H1 l ...
%           Replace with something like UNCLASSIFIED
%
% function this = constructor(varargin)
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
% Private Member Variables
%    mTitle: Title for the figure window
%
% Public Member Variables
%    Title: string: A title for the figure window
%
%
% Chapter 19
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 08-Feb-2006 17:03:11
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
%           Replace with something like UNCLASSIFIED
