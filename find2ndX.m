%find position of 2nd largest value
function pos = find2ndX(vec)
abs_vec = abs(vec);
sort_vec = sort(abs_vec,'descend');
pos = find(abs_vec == sort_vec(2));



