function epi = epipole( F )

[U S V]  = svd(F');

epi = V(:,end);

epi = star(epi);


end

