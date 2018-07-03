clc
clear
tic
Image1=imread('wynikkameraSTEREO11.jpg');
Image2=imread('wynikkameraSTEREO12.jpg');

size=738; % 41% obrazu wynikowego bo kamera ma kat 74 stopnie z 180
space=531; %29.5% obrazu wynikowego
wysokosc=1800;

Image3(1:3600,1:3600,1:3)=zeros;
Image3=uint8(Image3);
Image3((space+1):(space+size),1:3600,1:3)=Image1;
Image3((wysokosc+space+1):(3600-space),1:3600,1:3)=Image2;
imwrite(Image3,'panoramaTopBottom2.jpg');
toc

tic
A = imread('panoramaTopBottom.jpg');

v = VideoWriter('PanoramaH.avi','Uncompressed AVI');

open(v)

time=0;

 for i=1:t*30
     writeVideo(v,A)
     i
 end

close(v)
toc

