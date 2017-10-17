function eigs = eigG(H1, H2, m2, m3, sigma1, sigma2, Q)

M = G_linear(H1, H2, m2, m3, sigma1, sigma2, Q);

eigs = eig(M);

%eigs = imag(eigs(1))~=0;

end