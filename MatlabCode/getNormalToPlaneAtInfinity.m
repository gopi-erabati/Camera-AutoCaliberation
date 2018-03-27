function normal = getNormalToPlaneAtInfinity(PPM, A)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % function to get normal to plane at infinity
% 
%     input
%     PPM         Camera matrix
%     A          initial guess of intrinsics
%     
%     output
%     normal        normal to plane at infinity
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

w = A * A';

%define symbolic variables
nx = sym('nx', 'real');
ny = sym('ny', 'real');
nz = sym('nz', 'real');
l2 = sym('l2', 'real');

% normal to plane at Inf
n = [nx; ny; nz]; 

% Dual Absolute Quadric 
Q = [w, (w * n); (n' * w), (n' * w * n)]; 

%get one camera matrix
M2 = PPM(:, :, 2);

% autocalibration equation
m2 = M2 * Q * M2';

% solve linear equations
sol = solve(m2(1, 1) == (l2 * w(1, 1)), ...
            m2(2, 2) == (l2 * w(2, 2)), ...
            m2(3, 3) == (l2 * w(3, 3)), ...
            m2(1, 3) == (l2 * w(1, 3)));

normal = [double(sol.nx(1)) double(sol.ny(1)) double(sol.nz(1)) double(sol.l2(1))];
