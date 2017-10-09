
% divide image into 8 * 8 blocks 
% return cell
function blocks = im2block(img)
%clear all
%img = rand(100,100);
window = [8,8];
[m, n] = size(img);
blocks = {};
for i = 1 : ceil(m / window(1))
    for j = 1 : ceil(n / window(2))
        blocks{i,j} = imcrop(img,[(i - 1) * window(1) + 1, (j - 1) * window(2) + 1 , window(1) - 1,window(2) - 1]);
    end
end
