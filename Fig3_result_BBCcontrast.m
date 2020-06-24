
PC=[
    1.29737238314613,1.37367803623265,1.42012097615243,1.46498689091638,1.51160877306021,1.56160968887785,1.65620097468125;
    1.36011234923803,1.39162926371967,1.44713595709822,1.48803305911765,1.54415406315284,1.57443194244269,1.63993504508722;
    1.43015112758291,1.47491505065866,1.60537989723823,1.63392452743773,1.65491235327872,1.65451375288503,1.67005723038057;
    1.39348301151191,1.41580488573696,1.43442177772710,1.46450124860182,1.50390961023599,1.57432277287002,1.65944518521988];
  
Rating=[
    0 0.2286 0.325 0.45 0.7 0.95 1;
    0 0.2759 0.375 0.4857 0.5676 0.5641 1;
    0 0.3077 0.4815 0.5667 0.6177 0.5833 1.1482;
    0 0.3 0.5 0.5714 0.5807 0.7333 1.0333];



Xplot=0:0.001:1.045;
ft=fittype('a+b*0.5*(1+erf((x-mu)/sigma/sqrt(2)))');
[fitY2,Goodness2]=fit(mean(Rating)',mean(PC)',ft,'StartPoint',[1.3,0.4,0.5,2],'Lower',[1.3,0.1,0,0],'Upper',[1.7,0.4,1,100]);
h2=figure;
axes2=axes('Parent',h2,'XLim',[-0.14 1.25],'XTick',0:0.2:1.4,'YLim',[1.2 1.8],'YTick',1.3:0.2:2,'LineWidth',2,'FontSize',10);%,'XTickLabel',BCtypes
hold on
box(axes2,'on');
hold(axes2,'on');
set(gcf,'unit','inches','position',[1 1 5 5],'PaperSize', [4 4]);
plot([-1.1 8],[1.3 1.3],'LineStyle','--','Color',[0.5 0.5 0.5]);
plot([-1.1 8],[1.7 1.7],'LineStyle','--','Color',[0.5 0.5 0.5]);
plot(Xplot,fitY2(Xplot),'k-','LineWidth',1);
text(0.7,1.25,['r^2 = ',num2str(round(Goodness2.rsquare*1000)/1000)],'Color',[0 0 0],'FontSize',10);
errorbar(mean(Rating),mean(PC),std(PC)/sqrt(size(PC,1)),'ko','LineWidth',1,'MarkerSize',7);
xlabel('Interocular BC Strength Ratio','FontSize',8,'FontWeight','bold');
ylabel('Perceived Contrast','FontSize',8,'FontWeight','bold');
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.5 0.5 4.5 4.5]);
print(h2,['Fig3_BBC_Contrast.png'],'-dpng');

