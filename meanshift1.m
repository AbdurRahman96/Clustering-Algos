function intensity = meanshift1(features,current,lambda,tolX,maxIter) 
count=0;
strt=1;
sc=0;
time=1;

while(1)
%     disp(current);
%     disp(time);
sum=zeros(1,3);
temp1 = abs(features-repmat(current, size(features,1),1));
temp=zeros(size(temp1,1),1);

for i=1:size(temp,1)
  temp(i,1)= norm(temp1(i,:));
end


count=0;

% sc=sum((temp<lambda));

 for i = 1:size(temp,1)
   if (temp(i,1) < lambda)
     sum = sum + features(i,:);
     count=count+1;
   end
 end
 if (count~=0)
  mean=sum./count;
 else
  intensity=mean_p(1,3);

  return
 end
% diff=abs(mean-mean_p);
 if strt~=1
  if(norm(abs(mean-mean_p)) < tolX)
   intensity=mean(1,3);
   return
  end
 end
  
  mean_p=mean;
current= mean;
strt=0;
  


time= time+1  ;
end
   
end