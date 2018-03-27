function error = costFunctionKClassical(Fs, x)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % cost function to minimise to find the w
% 
%     input
%     Fs          Fundamental matrices
%     x           The initial instrinsic parameters
%     
%     output
%     error which is to be minimised by optimisation
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

%initial intrinsics
A=[x(1) x(2) x(3); 0 x(4) x(5); 0 0 1];

w = A * A';

error = [];

for i = 1 : size(Fs,3)-1
    for j = i+1 : size(Fs,4)
       
            % left part of Kruppas equations
            Kleft = Fs(:,:,i,j) * w * Fs(:,:,i,j)';
            Kleft = Kleft/norm(Kleft,'fro');
            
             % left part of Kruppas equations
            Kright = epipole(Fs(:,:,i,j)) * w * epipole(Fs(:,:,i,j))';
            Kright = Kright/norm(Kright, 'fro');
            
            % the difference
            Kdiff = Kleft - Kright;
            
            % the error
            error = [error Kdiff(1,:) Kdiff(2,2:3)] ;
        
    end
end


end

