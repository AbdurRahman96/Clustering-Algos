





clc;
clear all;
close all;

disp("Nodes connected by red line denote the clusters at every moment"); 
disp("Press any key to see consecutive clusters");

%Create Data set
M=10; %NUMBER OF NODES
A=randi([0 20],M,2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DIST MAT Calc
 dist=zeros(M,M);
 for i=1:M
    x=A(i,1);
    y=A(i,2);
    for j=1:M
       dist(i,j)= sqrt( (A(j,1)-x)^2 + (A(j,2)-y)^2 );
    end
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for i=1:M-1
plot(A(i,1),A(i,2),'*');
hold on;
text(A(i,1),A(i,2),num2str(i));
 end
 for i=1:M-2 
    temp=tril(dist);
    min_ele=min(temp(temp>0));
    [y,x]=find(temp==min_ele);
    dist(x,:)=min(dist(x,:),dist(y,:));
    dist(y,:)=min(dist(x,:),dist(y,:));
    dist(:,x)=min(dist(:,x),dist(:,y));
    dist(:,y)=0;
    dist(y,:)=0;
    
   
   %text(A(1,:),A(2,:),num2str(1:M));
   hold on;
   line([A(y,1),A(x,1)], [A(y,2),A(x,2)],'color','r','LineStyle', ':');
   pause
   
 end
    