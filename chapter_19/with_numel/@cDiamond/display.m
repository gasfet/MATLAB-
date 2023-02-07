function display(this, display_name)
% cDiamond::display: Replace with a short note that will appear on the H1 li ...
%           Replace with something like UNCLASSIFIED
%
% function display(this, display_name)
%
% Replace with text that you would like to have copied into the header of every
% file in this class
%
%
%
%
% Author Info
% Replace with your company's name
% Replace with your name
% Replace with your email address
% Replace with your phone number
% Replace with the author notes that you would like to appear just after the
% author info for every file in this class
% Replace with your standard copyright notice
% Replace this line with a string recognized by your revision control software
% A class_wizard v.3 assembled file, generated: 08-Feb-2006 17:02:00
%

if nargin < 2
    % assign 'ans' if inputname(1) empty
    display_name = inputname(1);
    if isempty(display_name)
        display_name = 'ans';
    end
end

% check whether mDisplayFunc has a value
% if it has a value feval the value to get the display
DisplayFunc = cell(size(this));
try
    [DisplayFunc{:}] = get(this, 'mDisplayFunc');
    use_standard_view = cellfun('isempty', DisplayFunc(:));
catch
    % any error will result in the use of standard view
    use_standard_view = repmat(true, size(this));
end

if isempty(use_standard_view) || all(use_standard_view(:))
    standard_view(this, display_name);
else
    for k = 1:length(this(:))
        if use_standard_view(k)
            standard_view(this(k), display_name);
        else
            indexed_display_name = sprintf('%s(%d)', display_name, k);
            feval(get(this(k), 'mDisplayFunc'), this(k), indexed_display_name);
        end
    end
end

% --------------------------
function standard_view(this, display_name)
if ~isempty( ...
        [strfind(display_name, '.') ...
         strfind(display_name, '(') ...
         strfind(display_name, '{')])
     display_name = 'ans';
end
% handle a scalar vs array object
if length(this(:)) == 1  % scalar case 
    % use eval to assign public struct into display_name variable
    eval([display_name ' = struct(this);']);
    % use eval to call display on the display_name structure
    eval(['display(' display_name ');']);
else  % array case
    % use eval to assign this into display_name variable
    eval([display_name ' = this;']);
    % use eval to call builtin display for size info
    eval(['builtin(''display'', ' display_name ');']);
    % still need to display variable names explicitly
    disp('    with public member variables:');
    % get list of public names with fieldname 
    names = fieldnames(this);
    % loop over the name list and display
    for name = names'
        disp(['        ' name{1}]);
    end
    % display extra line if loose
    if strcmp(get(0, 'FormatSpacing'), 'loose')
        disp(' ');
    end
end

% --------------------------
function developer_view(this, display_name)
disp('---- Public Member Variables ----');
full_display(struct(this), display_name);
disp('.... Private Member Variables ....');
full_display(this, display_name, true);
%           Replace with something like UNCLASSIFIED
