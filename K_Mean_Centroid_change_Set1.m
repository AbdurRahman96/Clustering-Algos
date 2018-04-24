%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% K mean algorithm groups given observationts to 'k' clusters. It calc the centroid of the observations % 
% and assign the observations to the cluster corresponding to nearest centroid.
% 
%
% NOTES:
% This program is to illustrate how the centoid changes for 2 clusters in K-Mean clustering algorithm
% Points denoted by '*' in red colour denotes centroid of the points
% It can be seen that the movement of centoid converges after few steps
% During compilation press any key to find consecutive centroid images
%
% Author: Abdur Rahman Mohamed Ismail 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear all;
close all;

disp("Press any key to find consecutive centroid images");

%Create Random Data set
A=[ [1,1];[1,5];[2,7];[10,8];[7,3];[6,7];[5,9];[14,0];[4,4];[12,7];[11,3];[9,6];[11,0];[4,1]];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%First step initialisation
k=2;     % NO of clusters 
Cmat=[[4,4];[12,6]]; % Random points as centroid to start the process
len=length(A);
Cindi=zeros(len,1);
Dmat=zeros(2,1);
Centmat=zeros(2,1);
  
for m=1:len 
 for i=1:len 
  for j=1:2
        a=(A(i,1) - Cmat(j,1))^2; % Finding the distance between centoid other points
        b=(A(i,2) - Cmat(j,2))^2;
   Dmat(j,1) = sqrt(a+b);
  end
  if (Dmat(1,1) < Dmat(2,1))
       Cindi(i,1)= 1;          %Pointers to denote which cluster they belong to
  else
       Cindi(i,1)= 2;
  end
   
    Dmat=zeros(2,1);
 end
Cmat=zeros(2,2);
for i=1:14
    if Cindi(i,1)== 1
        Cmat(1,1)= Cmat(1,1)+ (A(i,1)/len);  % Finding the centroid x axis
        Cmat(1,2)= Cmat(1,2)+ (A(i,2)/len);  % Finding the centroid y axis
    else
        Cmat(2,1)= Cmat(2,1)+ (A(i,1)/len);
        Cmat(2,2)= Cmat(2,2)+ (A(i,2)/len);
    end
end
    figure();
    plot(A(:,1),A(:,2),'b*');
    hold on;
    plot(Cmat(:,1),Cmat(:,2),'r*'); % Print the centroid points
        pause()
end


