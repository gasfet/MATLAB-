function this = draw(this, figure_handle)
% cShape::draw: Opens a figure window and draws the shape
%           Replace with something like UNCLASSIFIED
%
% function this = draw(this, figure_handle)
%
% Description:
%     Opens a figure window and draws the shape
%
% Member function of the class cShape
%     Replace with text that you would like to have copied into the header of
%     every file in this class
%
% Input Arguments::
%
%     this: cShape: The current object of type cShape
%
%     figure_handle: graphics handle: a graphics handle to the main figure
%          window.
%
% Output Arguments::
%
%     this: cShape: The current object of type cShape
%
% Chapter 20
% copyright (c) 2006 Andy Register
% A class_wizard v.3 assembled file, generated: 18-Jan-2006 17:11:36
%

if nargin < 2
    figure_handle = [];
end
if nargout ~= 1
    warning('draw must be called using: obj = draw(obj)');
else
    if ~isempty(this)
        handle_array = unique([figure_handle this(:).mFigureHandle]);
        if length(handle_array) ~= 1 % no handle or mismatched
            for k = fliplr(find([handle_array ~= figure_handle]))
                try
                    delete(handle_array(k));  % close figures
                end
                handle_array(k) = [];
            end
        end
        if isempty(handle_array)
            figure_handle = figure;  % create new figure
        else
            figure_handle = handle_array(1);
        end
       [this.mFigureHandle] = deal(figure_handle);  % save it
        figure(figure_handle);  % use the handle
        if nargin < 2  % assume if handle passed in, clf already called
            clf;   % clear the figure
        end
        
        hold on;  % all shapes drawn in the same figure
        for k = 1:length(this(:))
            this(k).mLineStyle.LineHandle = plot(...
                this(k).mSize(1) * this(k).mPoints(1,:), ...
                this(k).mSize(2) * this(k).mPoints(2,:), ...
                'Color', this(k).mLineStyle.Color, ...
                'LineWidth', this(k).mLineStyle.LineWidth ...
                );
        end
        hold off;
    end
end
%           Replace with something like UNCLASSIFIED
