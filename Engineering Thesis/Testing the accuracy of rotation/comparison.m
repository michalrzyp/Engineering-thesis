close all;
clear;
clc

 
 vid = videoinput('winvideo',1,'YUY2_1920x1080');
 set(vid,'ReturnedColorSpace','rgb');
 vid.TriggerRepeat = Inf;
 set(vid,'FramesPerTrigger',40000);
 
 start(vid);
 
 s = serial('COM23','BaudRate',9600);            % Create serial object (PORT Dependent)
 fopen(s);                                    % Open the serial port for r/w
 pause(2);
 
 pause(4);
     imgorg = getsnapshot(vid);
     imgorg=imrotate(imgorg,-90);
     imwrite(imgorg,'org.bmp');
 stop(vid);
 
 for i=1:5
     i
    
     fprintf(s,'7200');
      reading=0;
    
     while(reading ~= 1)
       reading=fread(s,1,'int'); 
     end
 end
 
 start(vid);
 pause(4);
     imgpor = getsnapshot(vid);
     imgpor=imrotate(imgpor,-90);
     imwrite(imgpor,'por.bmp');
 stop(vid);
 
 fclose(s);                                  % Close the serial port
 delete(s);                                  % Delete the serial object  



%imgorg=imread('org.bmp');
%imgpor=imread('por.bmp');
error=abs((double(imgorg)-double(imgpor)).^2);
mse=(mean2(error));
PSNR = 10 * log10( 255^2 / mse);

message = sprintf('The mean square error is %.2f.\nThe PSNR = %.2f', mse, PSNR);
msgbox(message);

error=abs((double(imgorg)-double(imgpor)));
error2=abs((double(imgorg)-double(imgpor))*10);

imshow(error(:,:,1),[-255 255]);
figure
imshow(error2(:,:,1),[-255 255]);

