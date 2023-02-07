function this = cat(varargin)
% cShapeArray::cat: 
%
% function this = cat(varargin)
%
% Chapter 19
%
% Author Info
% Copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 10-Feb-2006 09:59:40
%

this = feval(mfilename('class'));  % new empty container is destination
object_varargin = cell(size(varargin));  % object cell arrays will go in here

object_varargin{1} = varargin{1};
for idx = 2:length(varargin)
    object_varargin{idx} = expand_input(varargin{idx}, mfilename('class'), this.mType);
end

this.mArray = cat(object_varargin{:});
            
% --------------------------------------
function out_cell = expand_input(in_val, container_type, allowed_type)
if isa(in_val, container_type)
    out_cell = in_val.mArray;  % mArray is a cell array

elseif isa(in_val, allowed_type)
    out_cell = num2cell(in_val);

elseif isa(in_val, 'cell')
    out_cell = cell(size(in_val));
    for idx = 1:length(in_val(:))
        out_cell{idx} = expand_input(in_val{idx}, container_type, allowed_type);
    end
    if any(cellfun('length', out_cell(:)) > 1)
        error('Container:UnsupportedAssignment', ...
            'The input arguments are too complicated to easily expand.');
    end
    out_cell = reshape(cat(1, out_cell{:}), size(in_val));
else
    error('Container:UnsupportedAssignment', ...
        'Container cat for specified inputs is not supported.');
end    
