% Data Initialization 

lat = thingSpeakRead(1951496,'Fields',1,'ReadKey','3DT0QXNG1B2NVZD1','NumPoints',300,'Timeout',50,'OutputFormat','matrix');
lon = thingSpeakRead(1951496,'Fields',2,'ReadKey','3DT0QXNG1B2NVZD1','NumPoints',300,'Timeout',50,'OutputFormat','matrix');
alt = thingSpeakRead(1951496,'Fields',3,'ReadKey','3DT0QXNG1B2NVZD1','NumPoints',300,'Timeout',50,'OutputFormat','matrix');
acc = thingSpeakRead(1951496,'Fields',5,'ReadKey','3DT0QXNG1B2NVZD1','NumPoints',300,'Timeout',50,'OutputFormat','timetable');
speed=thingSpeakRead(1951496,'Fields',4,'ReadKey','3DT0QXNG1B2NVZD1','NumPoints',300,'Timeout',50,'OutputFormat','matrix');


%% %Create a geographic globe. Then, plot the data using linear markers. Plot
% a marker at every 25th data point by setting the MarkerIndices property.

uif = uifigure;
g = geoglobe(uif);
mskip = 1:25:length(lat);
geoplot3(g,lat,lon,alt,'-or','MarkerIndices',mskip)

