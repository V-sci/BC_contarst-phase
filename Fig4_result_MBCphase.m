clear;
x=1:5;
BCtype={'D-NS','D-MBC','D-BBC','M-NS','M-MBC'};

average=[-1.33325025	110.3748333	-3.3124165	79.10425025	122.2295]/2;
se=[2.019468934	1.867445609	2.292647492	2.809473289	5.283800222]/2;

h3=figure;
axes1=axes('Parent',h3,'XLim',[0 6],'XTick',1:5,'XTickLabel',BCtype,'YLim',[-25 100],'YTick',-0:15:90,'YTickLabel',{'0.0','15','30','45','60','75','90'},'LineWidth',2,'FontSize',8);
hold on
box(axes1,'on');
hold(axes1,'on');
set(gcf,'unit','inches','position',[1 1 5 5],'PaperSize', [4 4]);
plot([0 6],[45 45],'LineStyle','-','Color',[0.6 0.6 0.6],'LineWidth',1.5);
plot([0 6],[0 0],'LineStyle','-','Color',[0.6 0.6 0.6],'LineWidth',1.5);

bar(x',average',0.4,'k','LineWidth',1.5);
errorbar(x,average,se,'k.','LineWidth',1.5);
ylabel('Perceived Phase (above - below)/2','FontSize',8,'FontWeight','bold');
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.5 0.5 4.5 4.5]);
print(h3,'Fig4_MBC_Phase.png','-dpng','-r600');


