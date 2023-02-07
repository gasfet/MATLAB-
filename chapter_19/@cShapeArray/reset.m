function this = reset(this)
% cShapeArray::reset: Calls reset for every object in the container.
%
% function this = reset(this)
%
% Description:
%     Calls reset for every object in the container.
%
% Member function of the class cShapeArray
%     Chapter 19
%
% Input Arguments::
%
%     this: cShapeArray: The current or "active" object
%
% Output Arguments::
%
%     this: cShapeArray: The current or "active" object
%
% Chapter 19
% Copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 10-Feb-2006 09:59:40
%

for idx = 1:numel(this.mArray)
    this.mArray{idx} = reset(this.mArray{idx});
end
try
    delete(this.mFigHandle)
catch
    % NOP
end
this.mFigHandle = [];
