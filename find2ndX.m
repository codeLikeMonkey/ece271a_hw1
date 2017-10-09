%find position of 2nd largest value
function X = find2ndX(mat)
X = [];
for i = 1 : size(mat,1)
    vec = mat(i,:);
    abs_vec = abs(vec);
    sort_vec = sort(abs_vec,'descend');
    pos = find(abs_vec == sort_vec(2));
    X = [X ; pos];
end




