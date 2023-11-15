% Data Initialization 

lat = thingSpeakRead(1951496,'Fields',1,'ReadKey','3DT0QXNG1B2NVZD1','NumPoints',300,'Timeout',50,'OutputFormat','matrix');
lon = thingSpeakRead(1951496,'Fields',2,'ReadKey','3DT0QXNG1B2NVZD1','NumPoints',300,'Timeout',50,'OutputFormat','matrix');
alt = thingSpeakRead(1951496,'Fields',3,'ReadKey','3DT0QXNG1B2NVZD1','NumPoints',300,'Timeout',50,'OutputFormat','matrix');
acc = thingSpeakRead(1951496,'Fields',5,'ReadKey','3DT0QXNG1B2NVZD1','NumPoints',300,'Timeout',50,'OutputFormat','timetable');
speed=thingSpeakRead(1951496,'Fields',4,'ReadKey','3DT0QXNG1B2NVZD1','NumPoints',300,'Timeout',50,'OutputFormat','matrix');

%% Pre-processing the data
% outlier removal
lat1 = lat;
lon1 = lon;

% remove the data when speed is equal to 0 (Stop)
 idx = speed > 0; % 
 lat2 = lat1(idx);
 lon2 = lon1(idx);
 alt1 = alt(idx);
 speed2 = speed(idx);
 
 speedavg = mean(speed2);
 mean(speed);

%define projected coordinate reference system object (CRS)
%introduce ESPG code for Cluj-Napoca, Romania(3857)

proj = projcrs(3857);

%transform the latitude-longitude coordinates specified by lat and lon to
%the x and y map coordinates in the projected coordinate reference system 
% specified by proj

[x,y]=projfwd(proj,lat,lon);


% Turn the scanned point data into a surface
gx=0:4:264;
gy=0:4:400;
g=gridfit(x,y,z,gx,gy);
figure
colormap(hot(256));
surf(gx,gy,g);
camlight right;
lighting phong;
shading interp
line(x,y,z,'marker','.','markersize',4,'linestyle','none');
title 'Use topographic contours to recreate a surface'



%% Visualization
% set area limitation 
[latlim,lonlim] = geoquadline(lat,lon);
buf = 0.01;
[latlim,lonlim] = bufgeoquad(latlim,lonlim,buf,buf);
road = wmsfind('Street','SearchFields','any');
layer = road;
% Read web map
[A,R] = wmsread(layer(7),'Latlim',latlim,'Lonlim',lonlim);
geoshow(A,R);
% Overlay the data on map
geoshow(lat,lon,'Marker','o', 'MarkerSize', 8);shg
xlabel('Longitude');
ylabel('Latitude');
axis tight;

%%
% Copyright 2017 The MathWorks, Inc