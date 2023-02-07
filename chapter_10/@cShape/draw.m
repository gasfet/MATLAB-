function this = draw(this)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 10 example draw
%   (c) 2004 Andy Register
if nargout ~= 1
    warning('draw must be called using: obj = draw(obj)');
else
    if ~isempty(this)
        handle_array = unique([this(:).mFigureHandle]);
        if length(handle_array) ~= 1 % no handle or mismatched
            for k = 1:length(handle_array)
                try
                    delete(handle_array(k));  % close figures
                end
            end
            figure_handle = figure;  % create new figure
            [this.mFigureHandle] = deal(figure_handle);  % save it
        else
            figure(handle_array);  % use the handle
        end

        clf;   % clear the figure
        hold on;  % all shapes drawn in the same figure
        for k = 1:length(this(:))
            this(k).mPlotHandle = plot(...
                this(k).mSize(1) * this(k).mPoints(1,:), ...
                this(k).mSize(2) * this(k).mPoints(2,:), ...
                'Color', get(this(k), 'ColorRgb'));
        end
        hold off;
    end
end