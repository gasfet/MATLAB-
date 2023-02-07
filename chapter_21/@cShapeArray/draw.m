function this = draw(this, FigureHandle)
% cShapeArray::draw: Calls draw for every object in the container.  If ...
%
% function this = draw(this, FigureHandle)
%
% Description:
%     Calls draw for every object in the container.  If FigureHandle is not
%     passed in, draw will manage the use or creation of a figure window.
%
% Member function of the class cShapeArray
%     Chapter 19
%
% Input Arguments::
%
%     this: cShapeArray: The current or "active" object
%
%     FigureHandle: figure handle: Used to pass around a handle-graphics figure
%          handle
%
% Output Arguments::
%
%     this: cShapeArray: The current or "active" object
%
% Chapter 19
% Copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 10-Feb-2006 09:59:40
%

if nargout == 1
    do_assignin = false;
else
    do_assignin = true;
    callers_this = inputname(1);
    if isempty(callers_this)
        error('draw must be called using: obj = draw(obj) or draw(obj) where obj is a pure variable')
    end
end

if ~isempty(this.mArray)
    if nargin < 2
        FigureHandle = [];
    end
    shape_handles = [get(this(:), 'mFigureHandle')];
    if iscell(shape_handles)
        shape_handles = cell2mat(shape_handles);
    end
    handle_array = unique([FigureHandle shape_handles(:)']);
    if numel(handle_array) > 1 % mismatched
        for k = fliplr(find([handle_array ~= FigureHandle]))
            try
                delete(handle_array(k));  % close figures
            end
            handle_array(k) = [];
        end
    end
    if isempty(handle_array)
        FigureHandle = figure;  % create new figure
    else
        FigureHandle = handle_array(1);
    end
    figure(FigureHandle);
    
    if nargin < 2  % assume if handle passed in, clf already called
        clf;   % clear the figure
    end

    hold on;  % all shapes drawn in the same figure
    for k = 1:length(this.mArray(:))
        this.mArray{k} = draw(this.mArray{k}, FigureHandle);
    end
    hold off;
end

if do_assignin
  assignin('caller', callers_this, this);
end
