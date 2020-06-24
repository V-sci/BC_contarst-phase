clear;
x=1:5;
BCtype={'D-NS','D-MBC','D-BBC','M-NS','M-MBC'};
average=[1.680544	1.388357125	1.656962625 1.30149 1.309670875];
se=[0.005464231	0.019239752	0.009016775 0.006708772	0.008206313];

h4=figure;
axes1 = axes('Parent',h4,'XLim',[0 6],'XTick',1:5,'XTickLabel',BCtype,'YLim',[1.0 2],'YTick',1.1:0.2:1.9,'LineWidth',2,'FontSize',8);
hold on
box(axes1,'on');
hold(axes1,'on');
set(gcf,'unit','inches','position',[1 1 5 5],'PaperSize', [4 4]);
plot([0 7],[1.3 1.3],'LineStyle','-','Color',[0.6 0.6 0.6],'LineWidth',1.5);
plot([0 7],[1.7 1.7],'LineStyle','-','Color',[0.6 0.6 0.6],'LineWidth',1.5);
bar(x',average',0.4,'k','LineWidth',1.5);
errorbar(x,average,se,'k.','LineWidth',1.5);
ylabel('Perceived Contrast (log unit)','FontSize',8,'FontWeight','bold');
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.5 0.5 4.5 4.5]);
print(h4,'Fig1_MBC_Contrast.png','-dpng','-r600');%


