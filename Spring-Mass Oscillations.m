%Experimental Methods
%Lab 3: Task 1: Spring-Mass Oscillations
%November 30, 2021
                                 
%In this code, the frequncy data from two single
%mass-spring systems are used to theoretically compute what each of the
%masses's frequencies would be if they were attached in a series. This prediction is then tested
%experimentally.

close all; %close previously created figures
clear all; %clear the Workspace
clc; %clear the Command Window

%%
%The following section of code corresponds to the mass weighing 0.1kg.

m2=.100;%kg, named m2 instead of m1 to better agree with code calculating theoretical frequency
A=readtable('100glonger.csv');%read the csv containing the position and time data and store it as a table

% Create x and y vectors based on the time and position columns in
% the exported csv
x=A{:,1};%time vector
y=A{:,2};%position vector

%plot the position-time graph of the oscillation
figure; %new figure
plot(x,y);%create plot
title('Position vs Time for 0.1 kg mass');%enter an appropriate title 
ylabel('Position(m)')%y axis label
xlabel('Time(s)')%x axis label

%Fourier transform

%The following three lines of code perform a Fourier transform on the
%position vector, y
tr=fft(y); %find the fourier transform 
absy=abs(tr);%the positive values of the transform are extracted
absy=absy/length(y); %scale the transform

%Creating a frequency vector

fs=100; %samples/s, sampling frequency
vec=linspace(0, (length(y)/2)-1, 82); %frequency vector is created
vec=vec/length(y);%scale the frequency vector
vec=vec*fs; % the frequency vector is multiplied by sampling frequncy

%Plotting the Frequency Vector

figure;%new figure
plot(vec, absy(1:82)) %make a plot of all frequencies contained in the oscillation
title('Frequency Plot, 0.1 kg mass') %enter an approporiate title
xlabel('Frequency(Hz)')%x axis label
ylabel('Amplitude(m)')%y axis label

%Observations and Calculations

maxfr=18.4692; %Hz, the maximum frequency manually noted from previos plot. This is the second peak in the plot; the first peak is excluded.

%Next, the spring constant of the spring must be calculated but there is an
%intermediate step of first calculating the angular frequency, omega

omega=2*3.14*maxfr; %rad/s, angular frequency
k2=m2*omega*omega; %N/m, spring constant 

%The spring constant calculated is useful to later calculate the
%theoretical frequency


%%
%The following section of code corresponds to the mass weighing .2kg.

m1=.200; %kg
B=readtable('200glonger.csv');%read the csv of position-time data and store it as atable

%Create x and y vectors corresponding to the time and postiion columns in
%the importaed csv
x2=B{:,1};%time vector
y2=B{:,2};%position vector

%plot the position-time graph of the oscillation
figure;%new figure
plot(x2,y2);%plot the graph 
title('Position vs Time for 0.2 kg mass');%enter an appropriate title
ylabel('Position(m)')%y axis label
xlabel('Time(s)')%x axis label

%Fourier Transform

%The following three lines of code perform a Fourier transform on the
%position vector, y2
tr2=fft(y2);%find the fourrier transform
absy2=abs(tr2); %extract positive values of the transform
absy2=absy2/length(y2);%scale it

%Creating a frequency vector

fs2=100; %samples/s, this is the sampling frequency
vec2=linspace(0, (length(y2)/2)-1, 82); %frequency vector
vec2=vec2/length(y2);%scale it
vec2=vec2*fs2; %product of sampling frequency and frequency vector

%Plotting the frequency vector

figure;%new figure
plot(vec2, absy2(1:82))%create plot
title('Frequency plot, 0.2 kg mass')%give an appropriate title
xlabel('Frequency(Hz)')%x axis label
ylabel('Amplitude(m)')%y axis label

%Observations and Calculations

maxfre2=13.5441;%Hz, the maximum frequency manually noted from previos plot. This is the second peak in the plot; the first peak is excluded.

%Next, the spring constant of the spring must be calculated but there is an
%intermediate step of first calculating the angular frequency, omega

omega2=2*3.14*maxfre2;%rad/s, angular frequency
k1=m1*omega2*omega2;%N/m, spring constant


%%
% This code finds the natural frequencies for two coupled spring-masses,
% assuming the second is unattached, by solving the eigenvalue problem.

M = [m1,0;0,m2];
K = [k1+k2,-k2;-k2,k2];
[V,D] = eig(K,M);
freqs = zeros(2,1);
for i = 1:2
	freqs(i) = sqrt(D(i,i));
end
modes = V;
freqs=freqs/(2*3.14);


%%
%Connected Masses

%The following section of code corresponds to a system that consisted of
%two masses and two springs connected in series

m=m1+m2; %kg, total of the two masses used before
C=readtable('combinedlonger.csv');%read csv and store as a table

% Next, create x and y vectors based on the time and position columns in
% the exported csv
x3=C{:,1};
y3=C{:,2};

%plot the position-time graph of the oscillation
figure ; %new figure
plot(x3,y3);%Plot the position-time data of the system
title('Position vs Time for Series Combination');%appropriate title
ylabel('Position(m)')%y axis label
xlabel('Time(s)')%x axis label

%Fourier Transform

%The following three lines of code perform a Fourier transform on the
%position vector, y3
tr3=fft(y3); %find the fourier transform
absy3=abs(tr3);%extract the positive values of the transform
absy3=absy3/length(y3); %scale the transform

%Creating a frequency vector

fs3=100; %samples/s, this is the sampling frequency
vec3=linspace(0, (length(y3)/2)-1, 82); %frequency vector
vec3=vec3/length(y3);%scale the frequency vector
vec3=vec3*fs3; %product of frequency vector and sampling frequency

%Plotting the Frequency Vector

figure;%new figure
plot(vec3, absy3(1:82))%create plot
title('Frequency Plot for Series Combination')%add appropriate title
xlabel('Frequency(Hz)');%x axis label
ylabel('Amplitude(m)')%y axis label

%Observation and Calculation

%the next two lines of code will manually document the maximum frequencies corresponding to the two peaks on the above
%graph
maxfre3=10.4659;%Hz, maximum frequency of the larger mass
maxfre3_2=24.6256;%Hz, maximum frequency of the smaller mass

%The following two lines of code compare the percent error between the
%calculated maximum frequencies of the two masses in series (maxfre3 and
%maxfre3_2) and the theoretical maximum frequencies (freqs(1) and
%freqs(2)).
error1= (abs(freqs(1)- maxfre3)/freqs(1))*100; %percent error of larger mass
error2= (abs(freqs(2)- maxfre3_2)/freqs(2))*100; %percent error of smaller mass

%This is the end of the code, error1 and error2 will be used in analysis,
%commenting on the accuracy of the experimental setup in predicting the
%frequency of two masses connected in series.  

%THE END
