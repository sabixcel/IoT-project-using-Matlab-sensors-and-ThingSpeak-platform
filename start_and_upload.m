function [] = start_and_upload()
    m = mobiledev; % create object 
    t0 = datetime; % get the start time
    m.MagneticSensorEnabled = 1;
    m.AccelerationSensorEnabled = 1;
    m.AngularVelocitySensorEnabled = 1;
    m.OrientationSensorEnabled = 1;
    m.PositionSensorEnabled = 1;

    m.Logging = 1; % stat logging data
  
    pause(15); %wait until the connection is made

    global ok;

    while(ok)
        [lat, lon, t, speed, course, alt, horizacc] = poslog(m); % get position data
        [a, ta] = accellog(m); % get acceleartion data

    %   Convert X, Y and Z vectors to scalar values
        x = a(:,1); 
        y = a(:,2);
        z = a(:,3);
        mag = sqrt(sum(x.^2 + y.^2 + z.^2, 2)); % calculate the magnitude

    %   Remove constant effects such as gravity by subtracting the mean from data
        magNoG = mag - mean(mag);

    %   Because we have more samples for acceleration than position we
    %   calculate the mean of the magnitude of the acceleration in order to
    %   obtain the same number of samples for all data
        t_size = length(t);
        ta_size = length(ta);
        n = round(ta_size/t_size)-1;
        magNoG = magNoG(1:(n*t_size),1);
        magNoG = reshape(magNoG, [t_size,n]);
        accel = mean(magNoG,2);
       
    %   Send data to thingSpeak
        thingSpeakWrite(1951496,[lat, lon, alt, speed, accel],'WriteKey','11KP850VPM3KC2II','Timestamp',t0+t/24/60/60)
    %   Because of limitations of thingSpeak we cannot write continuously 
    %   => set a pause of 15 seconds 
        pause(15);
    end

    %   Disable sensors and stop connection
    m.MagneticSensorEnabled = 0;
    m.AccelerationSensorEnabled = 0;
    m.AngularVelocitySensorEnabled = 0;
    m.OrientationSensorEnabled = 0;
    m.PositionSensorEnabled = 0;

    discardlogs(m);
    clear m;
end

