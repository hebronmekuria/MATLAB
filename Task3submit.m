%Task 3: Image Processing
%Hebron Mekuria
%ENGR 245: Experimental Methods
%December 13 2021

% In this code, the aim is to take in two images and perform fast fourier
% transform filetering to reduce noise and increase the
% pictures' quality. What this means in that the pictures' informations are
% expressed into a function in the frequency domain so that certain
% frequencies causing noise can be zeroed out. The frequency vector is then
% converted back into the original form to give an edited image.


clc; %clear the Command Window
close all;% get rid of all created figures,
clear all; %Remove all created variables

set(0,'defaultAxesPlotBoxAspectRatioMode','manual')%this line of code makes all 
%created figures in this code have square dimensions. This, I have found,
%improves visualization. Credits for this code:Ameer Hamza, 16 Nov 2020, 'MATLAB Answers',
%mathworks.com


%%
%First image: This section is applied to the first image, photo2.jpg

%Image Extraction

% The image is imported and read

B=imread('photo2.jpg','jpg');%read image

%Separate RGB value

%This is done becuse photo2.jpg is a color image. Colored images in MATLAB
%are made up of a three-layer matrix that has a red, green and blue layer.
%This code will work on each layer separately and combine them in the end
%to get the final edited result

Red=B(:,:,1);%Red values are in the first layer
Green=B(:,:,2);%Green values are in the second layer
Blue=B(:,:,3);%Blue values are in the third layer


%Plot RGB Layers of the image

%The following code plots the extracted layers of the image that correspond
%to red, green and blue values.

figure;%new figure
subplot(1,3,1)%Create a subplot and go to the first place
imshow(Red);%Original image of red layer
title('Red Original')%enter appropriate title
subplot(1,3,2)%second place in the subplot
imshow(Green);%Original image of green layer
title('Green Original')%enter appropriate title
subplot(1,3,3)%third place in the subplot
imshow(Blue);%Original image of blue layer
title('Blue Original')%enter appropriate title


%Fourier Transforms

%A Fast Fourier Transform is applied to each layer separately and the
%transform is shifted for better visualization

Red=(fftshift(fft2(Red)));%FFT and shifting on Red layer
Green=(fftshift(fft2(Green)));%FFT and shifting on Green layer
Blue=(fftshift(fft2(Blue)));%FFT and shifting on Blue layer

%Saving Values

%The values of the fourier transforms are then saved in three variables so that they can be
%plotted later on in comparison to the filtered fourier transform

Red_I=Red;%saving Red's valaues 
Green_I=Green;%saving Green's values
Blue_I=Blue;%saving Blue's values

%Zeroing out Noise

%Next, using the Fourier transform image, light patches that are responsible for
%pixelation are identified and zeroed out. More explanation of this
%is found in the report.
%This is done similarly for all three layers of color.


%Red

Red(84:87, 42:44)=0;
Red(178:180, 54:56)=0;
Red(115:117,58:65)=0;
Red(115:120, 92:99)=0;
Red(175:183,200:211)=0;
Red(209:212,258:260)=0;
Red(178:180,241:244)=0;
Red(215:217,204:206)=0;
Red(30:34,204:206)=0;
Red(68:70,204:206)=0;
Red(114:118,283:286)=0;
Red(84:87,267:269)=0;
Red(114:118,20:23)=0;
Red(177:182,16:19)=0;
Red(262:265,96:98)=0;
Red(226:228,96:98)=0;
Red(268:271,42:44)=0;
Red(231:234,42:44)=0;
Red(41:45,96:98)=0;
Red(4:8,96:98)=0;

%Blue 

Blue(84:87, 42:44)=0;
Blue(178:180, 54:56)=0;
Blue(115:117,58:65)=0;
Blue(115:120, 92:99)=0;
Blue(175:183,200:211)=0;
Blue(209:212,258:260)=0;
Blue(178:180,241:244)=0;
Blue(215:217,204:206)=0;
Blue(30:34,204:206)=0;
Blue(68:70,204:206)=0;
Blue(114:118,283:286)=0;
Blue(84:87,267:269)=0;
Blue(114:118,20:23)=0;
Blue(177:182,16:19)=0;
Blue(262:265,96:98)=0;
Blue(226:228,96:98)=0;
Blue(268:271,42:44)=0;
Blue(231:234,42:44)=0;
Blue(41:45,96:98)=0;
Blue(4:8,96:98)=0;

%Green

Green(84:87, 42:44)=0;
Green(178:180, 54:56)=0;
Green(115:117,58:65)=0;
Green(115:120, 92:99)=0;
Green(175:183,200:211)=0;
Green(209:212,258:260)=0;
Green(178:180,241:244)=0;
Green(215:217,204:206)=0;
Green(30:34,204:206)=0;
Green(68:70,204:206)=0;
Green(114:118,283:286)=0;
Green(84:87,267:269)=0;
Green(114:118,20:23)=0;
Green(177:182,16:19)=0;
Green(262:265,96:98)=0;
Green(226:228,96:98)=0;
Green(268:271,42:44)=0;
Green(231:234,42:44)=0;
Green(41:45,96:98)=0;
Green(4:8,96:98)=0;


%Plotting intiial and final Fourier Transforms

%The Fourier transform before and after filtering is plotted to compare the
%areas that were and were not zeroed out.
%Although three transforms exist for the three layers, they are all
%identical so one representative comparison is plotted corresponding to the red layer

%Initial 

figure;%new figure
subplot(1,2,1);%create a subplot and go to the first position
imagesc(abs(Red_I),[0 100000]);%This creates the first image, limiting the c axis
title('Initial Fourier Transform, Flower')%Plot only one of the fourier transforms

%Edited/Filtered

subplot(1,2,2);%second position of the subplot 
imagesc(abs(Red),[0 100000]);%plot the edited fourier transform
title('Edited Fourier Transform, Flower')%enter appropriate title

%Reversing the Fourier Transform

%Next, the shift and fourier transform applied to the original matrices are
%reversed to be able to graph the edited picture

Red=ifft2(ifftshift(Red));%reversing actions done on red layer
Blue=ifft2(ifftshift(Blue));%reversing actions done on blue layer
Green=ifft2(ifftshift(Green));%reversing actions done on green layer


%Concatenatenation of RGB layers

%Next, the three layers are concatenated as the final step before plotting
%the Edited, less-pixelated image

B_2=zeros(294,300,3);%Create a zero matrix that resembles the dimensions of B
B_2(:,:,1)=Red;%Replace the first layer with Red
B_2(:,:,2)=Green;%Replace the second layer with Green
B_2(:,:,3)=Blue;%Replace the third layer with Blue

%Plot Initial and Edited Images side by side

%Final step! The edited image is plotted alongside the original on a
%subplot to compare the reduction in noise

%Initial image
figure;%new figure
subplot(1,2,1);%create subplot
imshow(B);%show the intial photo
title('Original Image');%enter an appropriate title

%Edited image
B_2=(real(B_2));%real values are extracted to enable plotting
B_2=uint8(B_2);%the double data type is changed to uint8 to resemble the data type of B
subplot(1,2,2); %go to second positon in the subplot
imagesc(B_2)%plot Edited Image
title('Edited Image')%Enter appropriate title



%%
%Second Image
%The following code also seeks to reduce noise in an image using fourier
%transforms. It is applied to a different image than the first section of
%this code, photo1.gif.

%Image extraction

% The image is imported and read

A=imread('photo1.gif'); %Read the imported image
A_O=A;%value is saved for creating a image later on

%Fourier Transform

A=(fftshift(fft2(A))); %take the 2D Fourier and shift for better 
%visualization
A_I=A;%The fourier transform value is saved so that it can be used later on to make a figure

%Filtering Noise

%In the following lines of code, sections in the transform that are
%believed to be responsible for pixelatin are identified and zeroed out.
%This is mostly done by trial and error, refering to the first fourier transform
%figure made in figure/sublplot 2

%Some points are symmetrical along the horizontal axis. For those points,
%their corresponding symmetrical point is zeroed out using a function
%called symm. Descriptions of this function is found at the bottom of
%the code, where it is constructed.

A(340:349,304:311)=0;
A((symm(349)):(symm(340)),304:311)=0;
A(338:345,480:487)=0;
A(symm(345):symm(338),480:487)=0;
A(249:254,305:307)=0;
A(245:254,481:483)=0;
A(524:530,309:312)=0;
A(523:530,485:487)=0;
A(202:209,392:394)=0;
A(569:580,397:405)=0;
A(290:305,385:403)=0;
A(symm(305):symm(290),385:400)=0;
A(296:300,218:220)=0;
A(341:346,207:216)=0;
A(387:389,571:573)=0;
A(433:436,582:584)=0;
A(478:482, 572:574)=0;

%Figures of the Fourier Transforms

%The following lines of code plot the pictorial representations of
%the fourier transforms on a subplot to compare them.

figure;%new figure
subplot(1,2,1)%new subplot
imagesc(abs(A_I), [0 100000]); %print the fourier transform's pictorial representation
title('Initial Fourier Transform, Man')%enter appropriate title

subplot(1,2,2)%select the second picture of the previosly created subplot
imagesc(abs(A), [0 100000]); %print the edited fourier transform 
title('Edited Fourier Transform, Man')%enter appropriate title

%Reversing Transform

%The following code converts the transform back into a format that can be translated into an
%image
A=ifft2(ifftshift(A));%reverse the shift and transform

%Plotting Image Comparison

% Next, the initial and edited images are plotted side-by-side

figure; %create a new figure
subplot(1,2,1) %create a new subplot
imagesc(A_O); %print the original image for comparing later with the edited one
colormap('gray')%view the image in grayscale
title('Original Image')%Enter appropriate title

subplot(1,2,2)%create subplot
A=real(A);%extract real components so that graphing would be possible
A=uint8(A);%the double data type is changed to uint8 to resemble the data type of the original A_O
imagesc(A)%create the edited image
title('Edited Image')%enter appropriate title
colormap('gray')%view the edited image in grayscale

%Functions

%I created a function to assist in zeroing out symmetrical points in the second
%photo. The function takes in a vertical axis point, and finds its
%vertically symmetrical (along the horizontal axis) point by subtracting the
%intiial point from the total length of the second column of the matrix


function b=symm(a)
A=imread('photo1.gif'); %The variable A needs to be created again, because functions
%cannot read functions in the bigger scope
b=length(A(:,1))-a;%actions of the function, described above.
end
