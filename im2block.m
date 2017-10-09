

% divide image into 8 * 8 blocks 
% return cell
function blocks = im2block(img,window)
%clear all
%img = rand(100,100);
%window = [8,8];
[m, n] = size(img);
blocks = {};
% x for x axis, y  for  y axis
for y = 1 : fix(m / window(1))
    for x = 1 : fix(n / window(2))
        blocks{x,y} = imcrop(img,[(x - 1) * window(1) + 1, (y - 1) * window(2) + 1 , window(1) - 1,window(2) - 1]);
        %block{x,y} = img((x - 1) * window(1) + 1 : x * window(1) , (y - 1) * window(2) + 1 : y * window(2));
    end
end
