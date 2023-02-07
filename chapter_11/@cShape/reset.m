function this = reset(this)
% A Comprehensive Guide to Object Oriented Programming in MATLAB
%   Chapter 11 reset
%   (c) 2004 Andy Register

for k = 1:length(this(:))
    this(k).mSize = this(k).mSize ./ this(k).mScale; % divide by scale
    this(k).mScale = ones(2,1);  % reset scale to 1:1
    try
        delete(this(k).mFigureHandle);
    end
    this(k).mFigureHandle = [];
    this(k).mPlotHandle = [];
end