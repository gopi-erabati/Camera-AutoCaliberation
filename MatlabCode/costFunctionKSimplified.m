function error = costFunctionKSimplified( Fs, x )
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % cost function to simplified Kruppas equations
% 
%     input
%     Fs          Fundamental matrices
%     x           The initial instrinsic parameters
%     
%     output
%     error which is to be minimised by optimisation
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


A=[x(1) x(2) x(3); 0 x(4) x(5); 0 0 1];

w = A * A';

error = [];

for i = 1 : size(Fs,3) - 1
    for j = i+1 : size(Fs,3)
        
        % find svd of fundamnetal matrix
        [U,D,V] = svd(Fs(:,:,i,j));
        
        u1 = U(:,1);
        u2 = U(:,2);
        u3 = U(:,3);
        
        v1 = V(:,1);
        v2 = V(:,2);
        v3 = V(:,3);
        
        r = D(1,1);
        s = D(2,2);
        
%         built the cost function
        a = -r^2 * v1' * w * v1 * u1' * w * u2;
        b = r * s * v1' * w * v2 * u2' * w * u2;
        
        c = r * s * v1' * w * v2 * u1' * w * u1;
        d = -s^2 * v2' * w * v2 * u1' * w * u2;
        
        e = r^2 * v1' * w * v1 * u1' * w * u1;
        f = s^2 * v2' * w * v2 * u2' * w * u2;
        
        error = [error (a-b)/sqrt(a^2 + b^2) (c-d)/sqrt(c^2 + d^2) (e-f)/sqrt(e^2 + f^2)];
        
    end
end


end

