
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
      %t = t + 1;
      %subplot(fix(255/m),fix(270/n),t);
      %imshow(result{i,j});
      zz = zigzag(dct2(result{i,j}));
      zigzag_data = [zigzag_data;zz];
    end
end

x_range = max([find2ndX(TrainsampleDCT_FG)',find2ndX(TrainsampleDCT_BG)']);
%x_range = 20;


X = find2ndX(zigzag_data);
hist_fg = hist(find2ndX(TrainsampleDCT_FG),1:x_range);
hist_bg = hist(find2ndX(TrainsampleDCT_BG),1:x_range);

P_fg = size(TrainsampleDCT_FG,1)/(size(TrainsampleDCT_BG,1) + size(TrainsampleDCT_FG,1));
P_bg = 1 - P_fg;

p_X = hist(X,1:x_range) / size(X,1);

p_x_given_fg = hist_fg / sum(hist_fg);

p_fg_given_x = [];
for x = 1 : x_range
    if p_X(x) > 0
        p_fg_given_x = [p_fg_given_x,p_x_given_fg(x) * P_fg/ p_X(x)];
    else
        p_fg_given_x = [p_fg_given_x,0];
    end
end
%finish mask
fg_mask = p_fg_given_x >= 0.5;

%mapping mask
fg_result = []
for i = 1 : size(fg_mask,2)
    
end
 
