function this = loadobj(this)
% cLineStyle::loadobj: 
%
% function this = loadobj(this)
%
%
%
%
% Author Info
% Chapter 20
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 17-Jun-2006 14:20:43
%

if ~isempty(this) && ~isempty(this(end).mTempStatic)
    static(this(end).mTempStatic);
    [this.mTempStatic] = deal([]);
end
