%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Mean shift algorithm is implemented to smoothen the image

   %Author: Abdur Rahman Mohamed Ismail
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
close all;
%img = imread('cameraman_noisy.png');  /// Uncomment and add your own file
                                               %here//
%imshow(img)
count_x = 1;
count_y = 1;

for i = 1:2:size(img,1)
    for j = 1:2:size(img,2)
        r_img(count_x,count_y) = img(i,j);
        count_y = count_y + 1;
    end
    count_x = count_x + 1;
    count_y = 1;
end
corr_img=zeros(size(r_img));
% imshow(r_img);
count = 1;
features = zeros(size(r_img,1)*size(r_img,2),3);



for i = 1:1:size(r_img,1)
    for j = 1:1:size(r_img,2)
        features(count,1) = i;
        features(count,2) = j;
        features(count,3) = r_img(i,j);
        count = count + 1;
    end
end
%con=(size(r_img,1)+size(r_img,2))/(255*2) ;
features = [features(:,1)/size(img,1) features(:,2)/size(img,2),(features(:,3))/255];

lambda = 0.3;  %%% Radius of the kernel%%%%%%%%%%%%%
tolX = 0.001;
maxIter = 1;

for i = 1:1:size(features,1)
    features(i,3) = meanshift1(features,features(i,:),lambda,tolX,maxIter);
    
end


for i=1:1:size(corr_img,1)
    corr_img(i,1:size(corr_img,2)) = features(size(corr_img,2)*(i-1)+1:size(corr_img,2)*(i),3)';
end

% imshow(corr_img);

figure()
subplot(2,2,1)
imshow(r_img)
title("Given image");
subplot(2,2,2)
% figure()
imshow(corr_img.*255)
title("Smoothened image");
subplot(2,2,3)



