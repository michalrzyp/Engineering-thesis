clc
clear
tic
a=imread('wynikkameraSTEREO11.jpg');
b=imread('wynikkameraSTEREO12.jpg');

rozmiar=738; % 41% obrazu wynikowego bo kamera ma kat 74 stopnie z 180
odstep=531; %29.5% obrazu wynikowego
wysokosc=1800;

c(1:3600,1:3600,1:3)=zeros;
c=uint8(c);
c((odstep+1):(odstep+rozmiar),1:3600,1:3)=a;
c((wysokosc+odstep+1):(3600-odstep),1:3600,1:3)=b;
imwrite(c,'panoramaTopBottom2.jpg');
toc

tic
A = imread('panoramaTopBottom.jpg');

v = VideoWriter('PanoramaH.avi','Uncompressed AVI');

open(v)

czas=0;

 for i=1:czas*30
     writeVideo(v,A)
     i
 end

close(v)
toc

