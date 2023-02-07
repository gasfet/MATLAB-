function this = times(lhs, rhs)
% cShapeArray::times: Redefines built-in behavior for .*.  Allows multip...
%
% function this = times(lhs, rhs)
%
% Description:
%     Redefines built-in behavior for .*.  Allows multiplication between the
%     container and arrays of doubles.
%
% Member function of the class cShapeArray
%     Chapter 19
%
% Input Arguments::
%
%     lhs: any type: The left-hand-side value in an expression, e.g., lhs * rhs
%
%     rhs: any type: The right-hand-side value in an expression, e.g., lhs * rhs
%
% Output Arguments::
%
%     this: cShapeArray: The current or "active" object
%
% Author Info
% Copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 10-Feb-2006 09:59:40
%

% one input must be cShape type, which one
if isa(lhs, 'cShapeArray')
    this = lhs;
    scale = rhs;
else
    this = rhs;
    scale = lhs;
end

if isnumeric(scale) && isreal(scale)
    error('Container:InvalidInput', ...
        'Multiplicand must be a real numeric value');
end

% only allow conditions that essentially result in .*
if length(scale) == 1
    scale = scale * ones(size(this.mArray));
elseif any(size(scale) ~= size(this.mArray))
    error('Container:InvalidInput', ...
        sprintf('%s\n', '??? Error using ==> times', 'Dimensions are not correct.'));
end

for idx = 1:length(this.mArray(:))
    this.mArray{idx} = this.mArray{idx} * scale(idx);
end