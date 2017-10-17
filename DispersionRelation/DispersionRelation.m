function eigs = DispersionRelation(k, H1, H2, m2, m3, s1, s2, Q)

M = -1i*k*G_linear(H1, H2, m2, m3, s1, s2, Q) - ...
    k^4*F_linear(H1, H2, m2, m3, s1, s2, Q);

eigs = eig(M);

end