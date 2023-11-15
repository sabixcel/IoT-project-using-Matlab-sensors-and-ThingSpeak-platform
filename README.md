# IoT-project-using-Matlab-sensors-and-ThingSpeak-platform

The project basically counts the number of steps taken by a person using the acceleration value retrieved from a Matlab Mobile sensor, sounds an alarm for exceeding a certain number of steps and also plots the GPS coordinates using others Matlab Mobile sensors.
Use cases: to monitor (via GPS and step count) in real time the route followed by a person, for example for jogging route, tracking route or hiking route.

The goal of the project is to retrieve information from Matlab Mobile Sensors, upload the acquired data to the ThingSpeak Channel, then stream the data from the cloud to a GUI.
Implementation requires: Matlab Mobile app, which will send the data in real time with a WiFi connection to Matlab running in MathWorks Cloud.
Sending data to ThingSpeak: An API key and channel ID are required.
Next, the GUI was created with Matlab's AppDesigner.

There are more details in the .pdf file documentation.
