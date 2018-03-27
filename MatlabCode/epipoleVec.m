function epi = epipoleVec( F )

[U S V]  = svd(F');

epi = V(:,end);


end

