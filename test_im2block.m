

img = imread('cheetah.bmp');
result = im2block(img);
t = 0;
for i = 1 : 32
    for j = 1:34
      t = t + 1
      subplot(32,34,t);
      imshow(result{i,j});
    end
end