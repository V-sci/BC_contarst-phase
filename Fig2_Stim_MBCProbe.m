d2p=90;
meanlum=155;
c0=0.1;   % 1 log
c1=0.4;   % 1.6 log
ci1=0.3;  % 1.5 log
% ci2=0.5;  % 1.7 log
SF=2.2;
DisSize=1.5;
PedSize=4.5;
sigma1=0.1062;
sigma2=0.1826;
ProLoc=0.375;
DotColor=[1 0.4 0];
DotLoc=1.5;
DotSize=0.13;

[x,y]=meshgrid(-PedSize/2:(1/d2p):PedSize/2);
DotMask=((x-DotLoc/2).^2+(y-DotLoc/2).^2<=(DotSize/2)^2);
DotMask=DotMask+((x-DotLoc/2).^2+(y+DotLoc/2).^2<=(DotSize/2)^2);
DotMask=DotMask+((x+DotLoc/2).^2+(y-DotLoc/2).^2<=(DotSize/2)^2);
DotMask=DotMask+((x+DotLoc/2).^2+(y+DotLoc/2).^2<=(DotSize/2)^2);
DisMask=(x.^2+y.^2<=(DisSize/2)^2);
RingMask=(x.^2+y.^2<=(DisSize/2+4/d2p)^2)-(x.^2+y.^2<=(DisSize/2-3/d2p)^2);
% imagesc(DotMask+DisMask);
% imagesc(RingMask+DotMask);
Probe=meanlum*sin(2*pi*SF*y+pi/2).*ci1.*exp(-(y-ProLoc).^2/(2*sigma1^2)-x.^2/(2*sigma2^2));
imwrite(uint8(Probe+meanlum),'Probe.tiff', 'tiff', 'Resolution',600);
%%%%%%%%%%%%% MBC rivalry %%%%%%%%%%%%
MBCRivalryGrating0=meanlum*(1+c1*sin(2*pi*SF*x+pi/2)).*DisMask+meanlum*(1+c1*sin(2*pi*SF*y+pi/2)).*(1-DisMask);
MBCRivalryGrating=zeros([size(x),3]);
for i=1:3
    MBCRivalryGrating(:,:,i)=MBCRivalryGrating0.*(1-DotMask)+255*DotColor(i).*DotMask;
end
imwrite(uint8(MBCRivalryGrating),'Fig2a_left_MBCRivalryGrating.tiff', 'tiff', 'Resolution',600);
%%%%%%%%%%%%   NS  %%%%%%%%%%%%%%%%%%%
HGratingLow0=meanlum*(1+c0*sin(2*pi*SF*y+pi/2)).*DisMask+meanlum*(1-DisMask);
HGratingHigh0=meanlum*(1+c1*sin(2*pi*SF*y+pi/2)).*DisMask+meanlum*(1-DisMask);
HGratingLow0Probe=(HGratingLow0+Probe).*DisMask+meanlum*(1-DisMask);
HGratingHigh0Probe=(HGratingHigh0+Probe).*DisMask+meanlum*(1-DisMask);
HGratingLow=zeros([size(x),3]);
HGratingHigh=zeros([size(x),3]);
HGratingLowProbe=zeros([size(x),3]);
HGratingHighProbe=zeros([size(x),3]);
for i=1:3
    HGratingLow(:,:,i)=HGratingLow0.*(1-DotMask)+255*DotColor(i).*DotMask;
    HGratingHigh(:,:,i)=HGratingHigh0.*(1-DotMask)+255*DotColor(i).*DotMask;
    HGratingLowProbe(:,:,i)=HGratingLow0Probe.*(1-DotMask)+255*DotColor(i).*DotMask;
    HGratingHighProbe(:,:,i)=HGratingHigh0Probe.*(1-DotMask)+255*DotColor(i).*DotMask;
end
imwrite(uint8(HGratingLow),'Fig2e_right_HGratingLow.tiff', 'tiff', 'Resolution',600);
imwrite(uint8(HGratingHigh),'Fig2d_right_HGratingHigh.tiff', 'tiff', 'Resolution',600);
imwrite(uint8(HGratingLowProbe),'Fig2d_left_HGratingLowProbe.tiff', 'tiff', 'Resolution',600);
imwrite(uint8(HGratingHighProbe),'Fig2e_left_HGratingHighProbe.tiff', 'tiff', 'Resolution',600);

%%%%%%%%%%%%   MBC  %%%%%%%%%%%%%%%%%%%
HGratingLow0=meanlum*(1+c0*sin(2*pi*SF*y+pi/2)).*DisMask+meanlum*(1+c1*sin(2*pi*SF*y+pi/2)).*(1-DisMask);
HGratingHigh0=meanlum*(1+c1*sin(2*pi*SF*y+pi/2));
HGratingLow0Probe=HGratingLow0+Probe;
HGratingHigh0Probe=HGratingHigh0+Probe;
HGratingLow=zeros([size(x),3]);
HGratingHigh=zeros([size(x),3]);
HGratingLowProbe=zeros([size(x),3]);
HGratingHighProbe=zeros([size(x),3]);
for i=1:3
    HGratingLow(:,:,i)=HGratingLow0.*(1-DotMask)+255*DotColor(i).*DotMask;
    HGratingHigh(:,:,i)=HGratingHigh0.*(1-DotMask)+255*DotColor(i).*DotMask;
    HGratingLowProbe(:,:,i)=HGratingLow0Probe.*(1-DotMask)+255*DotColor(i).*DotMask;
    HGratingHighProbe(:,:,i)=HGratingHigh0Probe.*(1-DotMask)+255*DotColor(i).*DotMask;
end
imwrite(uint8(HGratingLow),'Fig2c_right_HGratingLow.tiff', 'tiff', 'Resolution',600);
imwrite(uint8(HGratingHigh),'Fig2b_right_HGratingHigh.tiff', 'tiff', 'Resolution',600);
imwrite(uint8(HGratingLowProbe),'Fig2b_left_HGratingLowProbe.tiff', 'tiff', 'Resolution',600);
imwrite(uint8(HGratingHighProbe),'Fig2c_left_HGratingHighProbe.tiff', 'tiff', 'Resolution',600);


%%%%%%%%%%%%%     BBC     %%%%%%%%%%%%%%%%%%%
HGratingHigh0Ring=HGratingHigh0.*(1-RingMask)+(meanlum+12)*RingMask;
HGratingHigh0ProbeRing=HGratingHigh0Probe.*(1-RingMask)+(meanlum+12)*RingMask;
HGratingHighRing=zeros([size(x),3]);
HGratingHighProbeRing=zeros([size(x),3]);
for i=1:3
    HGratingHighRing(:,:,i)=HGratingHigh0Ring.*(1-DotMask)+255*DotColor(i).*DotMask;
    HGratingHighProbeRing(:,:,i)=HGratingHigh0ProbeRing.*(1-DotMask)+255*DotColor(i).*DotMask;
end
imwrite(uint8(HGratingHighRing),'Fig2f_right_HGratingHighRing.tiff', 'tiff', 'Resolution',600);
imwrite(uint8(HGratingHighProbeRing),'Fig2g_left_HGratingHighProbeRing.tiff', 'tiff', 'Resolution',600);
