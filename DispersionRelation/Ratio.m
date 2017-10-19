function [ r ] = Ratio( k, H1, H2, m2, m3, s1, s2, Q )
%RATIO Summary of this function goes here
%   Detailed explanation goes here

M = -1i*k*G_linear(H1, H2, m2, m3, s1, s2, Q) - ...
    k^4*F_linear(H1, H2, m2, m3, s1, s2, Q);

eigDR = DispersionRelation(k, H1, H2, m2, m3, s1, s2, Q);

r = (eigDR(1)-M(1,1))/(M(1,2));

end

