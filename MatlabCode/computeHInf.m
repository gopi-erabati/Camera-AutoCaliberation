function HInf = computeHInf(Fs,planeInf)
% this function to compute HInf

k = 1;
for i = 2:size(Fs,3)
    for j = i+1:size(Fs,3)
        HInf{k} =  epipole(Fs(:,:,i,j)) * Fs(:,:,i,j) + epipoleVec(Fs(:,:,i,j)) * planeInf';
        k = k+1;
    end
end
        


end

