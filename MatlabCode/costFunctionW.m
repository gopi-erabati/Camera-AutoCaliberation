function error = costFunctionW( HInf, x )
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %this cost function to minimise w 
% 
%     input
%     Hinf        homography at plane at infinity
%     x           The initial instrinsic parameters
%     
%     output
%     error which is to be minimised by optimisation
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

A=[x(1) x(2) x(3); 0 x(4) x(5); 0 0 1];

w = A * A';

error = [];

for i = 1:length(HInf)
   left =   HInf{i} * w * HInf{i}';
   errorTemp = left - w;
   
   error = [error errorTemp(1,:) errorTemp(2,2:3)] ;
   
end


end

