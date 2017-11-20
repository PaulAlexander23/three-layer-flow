% Main script for the nonlinear analysis section

H1 = 0.46;
H2 = 0.54;
m2 = 0.3;
m3 = 0.5;
s1 = 1;
s2 = 1;
Q = 1;

N = 101;
dm = 1/(N-1);
m = 0:dm:1;

Np = 6; % Number of pertubation sizes

Nx = 41;
x = linspace(0,2*pi,Nx);

omega_G = nan(N,N);
eig_G = nan(N,N,Np);

theta = 0; % Shift.

for i = 2:N
    for j = 2:N
        omega_G(i,j) = max(imag(eig(G_linear(H1,H2,m(i),m(j),s1,s2,Q))));
        
        eig_G(i,j,1) = max(imag(eig(G_nonlinear(H1,H2,m(i),m(j)))));
        
        for ip = 2:Np
            perturb = (H2-H1)*2^(-ip+1);
            eigs_G_x = zeros(Nx,1);
            for ix = 1:Nx
                eigs_G_x(ix) = max(imag(eig(G_nonlinear(H1+perturb*cos(x(ix)),H2+perturb*cos(x(ix)+theta),m(i),m(j)))));
            end
            eig_G(i,j,ip) = max(eigs_G_x);
            
        end
    end
end
%%

hold all;
bin_map = [1   1   1
          0.5 0.5 0.5];
colormap(bin_map)
imagesc(m,m,omega_G'>0,'alphadata',~isnan(omega_G'));
set(gca,'YDir','normal');

[X, Y] = meshgrid(m,m);


for ip = 2:Np
    contour(X,Y,eig_G(:,:,ip)',[0.001,0.001],'color',(0.8*(Np-ip+1)/Np)*ones(1,3));
end
contour(X,Y,eig_G(:,:,1)',[0.001,0.001],'color',zeros(1,3));
xlabel('m_2')
ylabel('m_3')
title({'Regions which contain mixed initial conditions '})
axis equal;
hold off;