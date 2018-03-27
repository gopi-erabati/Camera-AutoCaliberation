function error= costFunctionPlaneInf( PPM, w, n, lambda )
%this function to optimise to get plane at infinity

error = [];

for i=1:size(PPM,3)
   left = PPM(:,:,i) * [w, w*n ; n'*w, n'*w*n ] * PPM(:,:,i)';
   right = lambda * w;
   errorTemp = left-right;
   error = [error errorTemp(:)'];
end


end

