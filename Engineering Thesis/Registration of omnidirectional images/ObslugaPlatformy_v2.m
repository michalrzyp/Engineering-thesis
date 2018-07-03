clear
clc

number_of_images=3600;

numberCamera=1;
save=1;%0-brak zapisu 1-zapis
step='10'; %dodani-w lewo ujemny- w prawo

if (str2double(step) > 0)
    rotation=0;
else
    rotation=1;
end

s = serial('COM3','BaudRate',9600);            % Create serial object (PORT Dependent)
fopen(s);  

vid = videoinput('winvideo',2,'YUY2_1920x1080');
set(vid,'ReturnedColorSpace','rgb');
vid.TriggerRepeat = Inf;
set(vid,'FramesPerTrigger',3600);

for j=1:numberCamera
tic  

folder=sprintf('kamera%d',j);
mkdir (folder)

start(vid);

pause(4);

B=uint8(zeros(1920,number_of_images,3));

for i=1:number_of_images
    i
    img = getsnapshot(vid);

    pause(0.01);
    img = imrotate(img,90);
    B(:,i,:)=img(:,540,:);
    
    if (save==1 && mod(i,100)==0)
        imwrite(img(:,:,:),sprintf('%s//zdjecie%d.jpg',folder,i));
    end
     
   reading='';
   %fprintf(s, '10');
   fprintf(s, step);

   while(reading == '')
      reading=fread(s,1,'uchar'); 
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
time(1,j)=toc;
end