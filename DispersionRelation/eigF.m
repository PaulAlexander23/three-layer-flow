function eigs = eigF(H1, H2, m2, m3, sigma1, sigma2, Q)

M = F_linear(H1, H2, m2, m3, sigma1, sigma2, Q);

eigs = real(eig(M));

end