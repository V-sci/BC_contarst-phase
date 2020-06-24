d2p=100;
GLum=160;
%% grating 1
pedSize=4;
MeanLum=135;
disSize=1;
Contrast1=1.5;
Contrast2=1.3;
Contrast3=1.7;
SF=3;
A1=10.^Contrast1/100*MeanLum;
A2=10.^Contrast2/100*MeanLum;
A3=10.^Contrast3/100*MeanLum;
[x,y]=meshgrid(-round(pedSize/2*d2p)+0.5:1:round(pedSize/2*d2p)-0.5);
x=-x/d2p;
y=-y/d2p;
Ped=MeanLum.*ones(size(x));
DiskMask=(x<=0.5).*(x>=-0.5).*(y<=0.5).*(y>=-0.5);

LineMask=(x<=1).*(x>0.92).*(y<=1).*(y>=-1)+(x<-0.92).*(x>=-1).*(y<=1).*(y>=-1)+(y<=1).*(y>0.92).*(x<=1).*(x>=-1)+(y<-0.92).*(y>=-1).*(x<=1).*(x>=-1);
LineMask=LineMask+(x<=1).*(x>0.5).*(y<=0.02).*(y>=-0.02)+(x>=-1).*(x<-0.5).*(y<=0.02).*(y>=-0.02);
LMu=(y<=1).*(y>0.5).*(x<=0.04).*(x>=-0.04)+LineMask;
LMd=(y>=-1).*(y<-0.5).*(x<=0.04).*(x>=-0.04)+LineMask;
LMu=LMu>0;
LMd=LMd>0;

GHM0=MeanLum-A1.*cos(y*pi*2*SF);
GHML=MeanLum-A2.*cos(y*pi*2*SF);
GHH0=MeanLum-A3.*cos(y*pi*2*SF);
GHM45=MeanLum-A1.*cos(y*pi*2*SF-pi/4);
GHM_45=MeanLum-A1.*cos(y*pi*2*SF+pi/4);
GHM30=MeanLum-A1.*cos(y*pi*2*SF-pi/6);
GHL30=MeanLum-A2.*cos(y*pi*2*SF-pi/6);
GHL15=MeanLum-A2.*cos(y*pi*2*SF-pi/12);
GHM_30=MeanLum-A1.*cos(y*pi*2*SF+pi/6);
GHM60=MeanLum-A1.*cos(y*pi*2*SF-pi/3);
GHM_60=MeanLum-A1.*cos(y*pi*2*SF+pi/3);
GHM15=MeanLum-A1.*cos(y*pi*2*SF-pi/12);
GHM_15=MeanLum-A1.*cos(y*pi*2*SF+pi/12);
GHH_15=MeanLum-A3.*cos(y*pi*2*SF+pi/12);
GHH_75=MeanLum-A3.*cos(y*pi*2*SF+5*pi/12);
GHM135=MeanLum-A1.*cos(y*pi*2*SF-9*pi/12);
GHM_135=MeanLum-A1.*cos(y*pi*2*SF+9*pi/12);
GHH_135=MeanLum-A3.*cos(y*pi*2*SF+9*pi/12);
GHH_180=MeanLum-A3.*cos(y*pi*2*SF+pi);
GHM_180=MeanLum-A1.*cos(y*pi*2*SF+pi);
GHL45=MeanLum-A2.*cos(y*pi*2*SF-pi/4);
GHL_45=MeanLum-A2.*cos(y*pi*2*SF+pi/4);
GHH45=MeanLum-A3.*cos(y*pi*2*SF-pi/4);
GHH_45=MeanLum-A3.*cos(y*pi*2*SF+pi/4);
GVM=MeanLum-A1.*cos(x*pi*2*SF);
GVH=MeanLum-A3.*cos(x*pi*2*SF);
%%%add by wy
GHM180=MeanLum-A1.*cos(y*pi*2*SF-pi);
GHL180=MeanLum-A2.*cos(y*pi*2*SF-pi);
GHH180=MeanLum-A3.*cos(y*pi*2*SF-pi);
GHM90=MeanLum-A1.*cos(y*pi*2*SF-pi/2);
GHL90=MeanLum-A2.*cos(y*pi*2*SF-pi/2);
GHH90=MeanLum-A3.*cos(y*pi*2*SF-pi/2);

%a_MBC_left and a_MBC_right
L1545=zeros([size(x),3]);
R1545=zeros([size(x),3]);
for i=1:3
    L1545(:,:,i)=GHH_75.*(1-DiskMask)+GHL45.*DiskMask;
    L1545(:,:,i)=L1545(:,:,i).*(1-LMu);
    R1545(:,:,i)=GHH_75.*(1-DiskMask)+GHH_45.*DiskMask;
    R1545(:,:,i)=R1545(:,:,i).*(1-LMd);
end
    Limg=L1545;
    Rimg=R1545;
    Limg(:,:,2)=L1545(:,:,2)+GLum*LMu;
    Rimg(:,:,2)=R1545(:,:,2)+GLum*LMd;
    imwrite(uint8(Limg),'Fig3a_BBC_left.tiff', 'tiff','Resolution',600);
    imwrite(uint8(Rimg),'Fig3a_BBC_right.tiff', 'tiff','Resolution',600);
