function [lat,lon,alt,acc,time]=read()
%return read values as matrices
readk='1JZ20CRZYUOEPCCC';

% lat = thingSpeakRead(1951496,'Fields',1,'ReadKey',readk,'NumPoints',1000,'Timeout',50,'OutputFormat','matrix');
% lon = thingSpeakRead(1951496,'Fields',2,'ReadKey',readk,'NumPoints',1000,'Timeout',50,'OutputFormat','matrix');
% alt = thingSpeakRead(1951496,'Fields',3,'ReadKey',readk,'NumPoints',1000,'Timeout',50,'OutputFormat','matrix');
% acc = thingSpeakRead(1951496,'Fields',5,'ReadKey',readk,'NumPoints',1000,'Timeout',50,'OutputFormat','matrix');

data = thingSpeakRead(1944434,'Fields',[1:5],'ReadKey',readk,'NumPoints',1000,OutputFormat='TimeTable');
    time=data.Timestamps;
    lat=data.Latitude;
    lon = data.Longitude;
    alt = data.Altitude;
    acc = data.Acceleration_no_G;


  end