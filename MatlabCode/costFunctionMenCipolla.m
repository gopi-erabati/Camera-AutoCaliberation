function error = costFunctionMenCipolla(Fs, x )
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % cost function to Mendonca & Cipolla 
% 
%     input
%     Fs          Fundamental matrices
%     x           The initial instrinsic parameters
%     
%     output
%     error which is to be minimised by optimisation
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

A = [x(1) x(2) x(3); 0 x(4) x(5); 0 0 1];

w = A * A';

error = [];

for i = 1 : size(Fs,3) - 1
    for j = i+1 : size(Fs,3)
        
        % compute essential matrix
        E = A' * Fs(:,:,i,j) * A;
        
        % calculate singular values
        [~,D,~] = svd(E);
        
        s1 = D(1,1);
        s2 = D(2,2);
        
        % built the cost function
        diff = 1/45 * (s1 - s2)/s2;
        
        error = [error diff];
        
    end
end
        

end

