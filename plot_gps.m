function[]=plot_gps(data)
%% %Create a geographic globe. Then, plot the data using linear markers. Plot
% a marker at every 25th data point by setting the MarkerIndices property.

lat=data.Latitude;
lon=data.Longitude;
alt=data.Altitude;
uif = uifigure;
g = geoglobe(uif);
mskip = 1:25:length(lat);
geoplot3(g,lat,lon,alt,'-or','MarkerIndices',mskip)

end