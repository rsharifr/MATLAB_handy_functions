% saveFig is a function that saves a figure (identified by the integer
% number, figureHandle.) The output file is in the format specified by the
% string "format" and has the dimensions specified in inches in the variable
% "figDim". The cell type vaiable "formats saves multiple files with
% formats pdf, eps, fig, png, etc. The formats are the same as the one used
% by Matlab's native "print" function. 


function saveFig(width, height, location, fileName, format, figureHandle, saveMatlabFigure)
if ~exist('figureHandle','var')
    figureHandle = gcf;
end
try 
    set(figureHandle,'Renderer','Painters');
catch
    warning('Figure renderer could not be changed')
end
    
figDim = [width height];
set(figureHandle,'units','inches');
set(figureHandle,'PaperUnits','inches');

originalPosition = get(figureHandle,'Position');
newPosition = [originalPosition(1:2) figDim];

set(figureHandle,...
    'PaperSize', figDim,...
    'Position',newPosition,...    
    'PaperPositionMode', 'auto');

if (isempty(location))
    dest = fileName;
else
    if ~exist(location,'dir'), mkdir(location); end
    dest = [location '\' fileName];
end

print(figureHandle,['-d' format],[dest '.' format],'-r600')
if exist('saveMatlabFigure','var')
    if ~saveMatlabFigure
        return
    end
end
saveas(figureHandle,[dest '.fig'])

