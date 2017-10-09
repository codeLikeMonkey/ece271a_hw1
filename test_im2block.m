

img = imread('cheetah.bmp');
m =40;
n =40;
result = im2block(img,[m,n]);
t = 0;
for i = 1 : fix(255/m)
    for j = 1:fix(270/n)
      t = t + 1;
      subplot(fix(255/m),fix(270/n),t);
      imshow(result{i,j});
    end
end