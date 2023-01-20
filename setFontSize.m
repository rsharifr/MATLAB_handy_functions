function SetFontSize(handle,fontSize)

set(findall(handle,'type','text'),'FontSize',fontSize)
set(findall(handle,'type','axes'),'fontsize',fontSize)

% Alternative method:
% set(findall(handle,'-property','FontSize'),'FontSize',7)