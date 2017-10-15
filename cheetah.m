
close all
clear all
clc
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
      zz = zigzag(dct2(result{i,j}));
      zigzag_data = [zigzag_data;zz];
    end
end

%x_range = max([find2ndX(TrainsampleDCT_FG)',find2ndX(TrainsampleDCT_BG)']);
x_range = 64;


X = find2ndX(zigzag_data);


%%
% Compute prior pobability
hist_fg = hist(find2ndX(TrainsampleDCT_FG),1:x_range);
hist_bg = hist(find2ndX(TrainsampleDCT_BG),1:x_range);
%prblem a
P_fg = size(TrainsampleDCT_FG,1)/(size(TrainsampleDCT_BG,1) + size(TrainsampleDCT_FG,1))
P_bg = 1 - P_fg;

p_X = hist(X,1:x_range) / size(X,1);
%%
% probelm b
p_x_given_fg = hist_fg / sum(hist_fg);
p_x_given_bg = hist_bg / sum(hist_bg);
%plot them
figure
bar(p_x_given_fg);
xlabel('Index x');
ylabel('Probability');
title('Index histogram of Px|y(x|cheetah)','FontWeight','bold')

figure
bar(p_x_given_bg,'r');
xlabel('Index x');
ylabel('Probability');
title('Index histogram of Px|y(x|grass)','FontWeight','bold')
%%

p_fg_given_x = [];
for x = 1 : x_range
    if p_X(x) > 0
        p_fg_given_x = [p_fg_given_x,p_x_given_fg(x) * P_fg/ p_X(x)];
    else
        p_fg_given_x = [p_fg_given_x,1];
    end
end
%
Y = p_fg_given_x;
% figure
% imagesc(Y)
% colormap(gray(255))
%title('c : state of variable Y');

%%
%finish mask
fg_mask = p_fg_given_x >= 0.5;
%imagesc(fg_mask)
%mapping mask
fg_result = zeros(size(X,1),1);
for i = 1 : size(fg_mask,2)
    fg_result = (X == fg_mask(i) * i) | fg_result;
end

%fg_result
new_img = [];
t = 0;

for j = 1 + n / 2 :1:size(img,2) - n /2 
    for i = 1 + m/ 2 :1: size(img,1) - m /2
        new_img(i,j) = fg_mask(find2ndX(zigzag(dct2(img(i - m/2 : i + m /2 - 1 , j - n/2 : j + n / 2 - 1)))));
    end
end

figure
%imshow(new_img);
imagesc(new_img)
colormap(gray(255))
title('The estimate image');
mask_img = imread('cheetah_mask.bmp') > 0;
cheetah_mask = mask_img(1:size(new_img,1),1:size(new_img,2));
%figure 
%imshow(cheetah_mask)
error_rate = sum(sum(abs(cheetah_mask - new_img))) / (size(new_img,1) * size(new_img,2)) * 100




 
