function K = calculateKFromW( w )

k1 = w(1);
k2 = w(2);
k3 = w(3);
k4 = w(4);
k5 = w(5);

au = sqrt(k1 - (k2 - k3 * k5)^2/(k4 - k5^2) - k3^2);

gamma = (k2 - k3 * k5)^2/sqrt(k4 - k5^2);

u0 = k3;

v0 = k5;

av = sqrt(k4 - k5^2);

K = [au gamma u0
    0 av v0
    0 0 1];
    
end

