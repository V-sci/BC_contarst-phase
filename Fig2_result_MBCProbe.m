DataMean=[
    0.9097
    1.3655
    1.1030
    1.0224
    1.0923
    1.0712
    ];
DataSe=[
    0.0283
    0.0471
    0.0358
    0.0433
    0.0440
    0.0837
    ];

h4=figure;
axes4=axes('Parent',h4,'XLim',[0.7 1.9],'XTick',1:0.6:1.6,'YLim',[0.71 1.56],'YTick',0.8:0.2:1.7,'LineWidth',2,'FontSize',8);%,'XTickLabel',BCtypes
hold on
box(axes4,'on');
hold(axes4,'on');
set(gcf,'unit','inches','position',[1 1 5 5],'PaperSize', [4 4]);
errorbar([1 1.6],DataMean(1:2),DataSe(1:2),'ko-','LineWidth',2,'MarkerFaceColor',[0 0 0],'MarkerSize',8);%,'MarkerFaceColor',[0 0 0],'Color',[0 1 0]
errorbar([1 1.6],DataMean(5:6),DataSe(5:6),'k^-','LineWidth',2,'MarkerFaceColor',[0 0 0],'MarkerSize',8);%'MarkerFaceColor',[1 1 1],'Color',[0 0 1],
errorbar([1 1.6],DataMean(3:4),DataSe(3:4),'ks-','LineWidth',2,'MarkerSize',8);%'MarkerFaceColor',[248 147 29],'Color',[1 0 0],
text(0.82,1.50,'D-MBC','Color',[0 0 0],'FontSize',8);
text(0.82,1.43,'D-NS','Color',[0 0 0],'FontSize',8);
text(0.82,1.36,'D-BBC/ring','Color',[0 0 0],'FontSize',8);
plot(0.78,1.50,'ko-','LineWidth',2,'MarkerFaceColor',[0 0 0],'MarkerSize',7);
plot(0.78,1.43,'ks-','LineWidth',2,'MarkerSize',7);%,'MarkerFaceColor',[248 147 29]
plot(0.78,1.36,'k^-','LineWidth',2,'MarkerFaceColor',[0 0 0],'MarkerSize',7);%,'Color',[0 0 1]


xlabel('Pedestal Contrast (Log %)','FontSize',8,'FontWeight','bold');
ylabel('Increment Contrast Threshold (Log %)','FontSize',8,'FontWeight','bold');
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.5 0.5 4.5 4.5]);
print(h4,['Fig2_MBC_ProbeThreshold.png'],'-dpng');
