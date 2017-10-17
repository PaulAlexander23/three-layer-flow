function [ cg ] = eigenvalue( h1, h2, m2, m3 )

M = G_nonlinear(h1, h2, m2, m3);

cg = eig(M);

end

