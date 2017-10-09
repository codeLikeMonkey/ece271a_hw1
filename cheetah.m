
close all
clear all
load('TrainingSamplesDCT_8.mat');
img = double(imread('cheetah.bmp')) / 255;
m =8;
n =8;
result = im2block(img,[m,n]);
t = 0;
zigzag_data = [];
X = [];
for j = 1 : fix(255/m) 
    for i = 1:fix(270/n)
      %t = t + 1;
      %subplot(fix(255/m),fix(270/n),t);
      %imshow(result{i,j});
      zz = zigzag(dct2(result{i,j}));
      zigzag_data = [zigzag_data;zz];
    end
end
X = find2ndX(zigzag_data);
subplot(1,3,1)
histogram(X);
%hold on
subplot(1,3,2)
histogram(find2ndX(TrainsampleDCT_BG));
%hold on
subplot(1,3,3)
histogram(find2ndX(TrainsampleDCT_FG));
%hist([X';find2ndX(TrainsampleDCT_FG)';find2ndX(TrainsampleDCT_BG)']);

