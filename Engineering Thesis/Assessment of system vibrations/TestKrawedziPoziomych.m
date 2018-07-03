clear;
clc;

tic

Maska=[1 2 1 ; 
        0 0 0 ; 
        -1 -2 -1] ;

Obraz1=imread('zd.jpg');

  
    
czerwona1=conv2(Maska,Obraz1(:,:,1));
zielona1=conv2(Maska,Obraz1(:,:,2));
niebieska1=conv2(Maska,Obraz1(:,:,3));

Obraz1=uint8(czerwona1+zielona1+niebieska1);
%imshow(Obraz1);
imwrite(Obraz1,'test2.jpg');




