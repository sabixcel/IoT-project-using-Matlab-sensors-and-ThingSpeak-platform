function [lat,lon,alt,acc]=read()
%return read values as matrices
readk='3DT0QXNG1B2NVZD1';

lat = thingSpeakRead(1951496,'Fields',1,'ReadKey',readk,'NumPoints',1000,'Timeout',50,'OutputFormat','matrix');
lon = thingSpeakRead(1951496,'Fields',2,'ReadKey',readk,'NumPoints',1000,'Timeout',50,'OutputFormat','matrix');
alt = thingSpeakRead(1951496,'Fields',3,'ReadKey',readk,'NumPoints',1000,'Timeout',50,'OutputFormat','matrix');
acc = thingSpeakRead(1951496,'Fields',5,'ReadKey',readk,'NumPoints',1000,'Timeout',50,'OutputFormat','matrix');
           

 end