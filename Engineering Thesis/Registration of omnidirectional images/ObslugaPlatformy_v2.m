clear
clc

liczba_zdjec=3600;

liczbaKamer=1;
zapis=1;%0-brak zapisu 1-zapis
krok='10'; %dodani-w lewo ujemny- w prawo

if (str2double(krok) > 0)
    obrot=0;
else
    obrot=1;
end

s = serial('COM3','BaudRate',9600);            % Create serial object (PORT Dependent)
fopen(s);  

vid = videoinput('winvideo',2,'YUY2_1920x1080');
set(vid,'ReturnedColorSpace','rgb');
vid.TriggerRepeat = Inf;
set(vid,'FramesPerTrigger',3600);

for j=1:liczbaKamer
tic  

folder=sprintf('kamera%d',j);
mkdir (folder)

start(vid);

pause(4);

B=uint8(zeros(1920,liczba_zdjec,3));

for i=1:liczba_zdjec
    i
    img = getsnapshot(vid);

    pause(0.01);
    img = imrotate(img,90);
    B(:,i,:)=img(:,540,:);
    
    if (zapis==1 && mod(i,100)==0)
        imwrite(img(:,:,:),sprintf('%s//zdjecie%d.jpg',folder,i));
    end
     
   odczyt='';
   %fprintf(s, '10');
   fprintf(s, krok);

   while(odczyt == '')
      odczyt=fread(s,1,'uchar'); 
   end
   
    out = imaqmem;
    mem_left = out.FrameMemoryLimit - out.FrameMemoryUsed;
    half_of_memlimit=(out.FrameMemoryLimit/2);
	if mem_left < half_of_memlimit
       flushdata(vid,'triggers');
       flushdata(vid,'triggers');
    end;
    
end

pause(3);

stop(vid);

fclose(s);                                  % Close the serial port
delete(s);                                  % Delete the serial object  

if (obrot==0)
   B = B(end:-1:1,:,:);
end

imwrite(B,sprintf('wynik%s.bmp',folder));
imshow(B);
czas(1,j)=toc;
end