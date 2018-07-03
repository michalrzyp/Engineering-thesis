clear;
clc;

tic

Mask=  [1 2 1 ; 
        0 0 0 ; 
        -1 -2 -1] ;

Image1=imread('zd.jpg');

  
    
red1=conv2(Mask,Image1(:,:,1));
green1=conv2(Mask,Image1(:,:,2));
blue1=conv2(Mask,Image1(:,:,3));

Obraz1=uint8(red1+green1+blue1);
%imshow(Obraz1);
imwrite(Image1,'test2.jpg');




