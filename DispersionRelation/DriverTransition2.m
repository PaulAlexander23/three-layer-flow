%%%
%%% Driver for the Dispersion Relation Section - Transition
%%%

close all;

s1 = 1;
s2 = 1;
Q = 1;
kf = 1.5;

%C1 = [0.1    0.2    0.5000    0.7000];
%C2 = [0.3    0.2    0.5000    0.7000];

C1 = [0.7 0.2 0.5 0.7];
C2 = [0.7 0.22 0.5 0.7];

M = 21;
N = 101;
eigenvalues = zeros(M,N);

m2points = zeros(M,1);
m3points = zeros(M,1);

for m = 1:M
    C = C1*(M-m)/(M-1) + C2*(m-1)/(M-1);
    
    m2 = C(1); m3 = C(2); H1 = C(3); H2 = C(4);
    
    m2points(m) = m2;
    m3points(m) = m3;
    
    dk = kf/(N-1);
    k = 0:dk:kf;
    
    for n = 1:N
        eigenvalues(m,n) = max(real(DispersionRelation(k(n),H1,H2,m2,m3,s1,s2,Q)));
    end
end

%[X, Y] = meshgrid((0:M-1)/(M-1),k);
%surf(X,Y,eigenvalues');
figure;
plot(k,eigenvalues)
ax = gca;
ax.XAxisLocation = 'origin';
xlabel('k')
ylabel('Re(\omega)')
title('Dispersion Relation')


figure;
PlotVaryingMu(H_1, H_2,m2points,m3points,s1,s2,Q)

%%
% function plotDR(m2, m3, H1, H2, s1, s2, Q, kf)
% %%% Plot Dispersion Relation
% 
% N = 101;
% dk = kf/(N-1);
% k = 0:dk:kf;
% eigenvalues = zeros(N,2);
% 
% for i = 1:N
%     eigenvalues(i,:) = DispersionRelation(k(i),H1,H2,m2,m3,s1,s2,Q);
% end
% 
% plot(k/kf,max(real(eigenvalues),[],2))
% if kf == 1
%     xlabel('k')
% else
%     xlabel(['k/',num2str(kf)])
% end
% ylabel('Re(\omega)')
% title({'Dispersion Relation:', ['m2 = ', num2str(m2) ', m3 = ' num2str(m3)]})
% 
% end
% 
% function plotMPMu(m2_s, m3_s, H1_s, H2_s, s1, s2, Q)
% %%% Plot M-P Instabilities in mu
% 
% k = 0.1;
% 
% H1 = H1_s;
% H2 = H2_s;
% 
% N = 201;
% dM = 1/(N-1);
% M = 0:dM:1;
% eigenvaluesG = nan(N,N);
% eigenvaluesDR = nan(N,N);
% 
% for i = 2:N
%     for j = 2:N
%         eigenvaluesG(i,j) = eigG(H1,H2,M(i),M(j),s1,s2,Q);
%         eigenvaluesDR(i,j) = eigDR(k,H1,H2,M(i),M(j),s1,s2,Q);
%     end
% end
% 
% hold on;
% bin_map = [1   1   1
%     0.5 0.5 0.5];
% colormap(bin_map)
% imagesc(M,M,eigenvaluesDR');
% set(gca,'YDir','normal');
% 
% [X, Y] = meshgrid(M,M);
% contour(X,Y,eigenvaluesG',1,'k');
% 
% plot(m2_s,m3_s,'xk');
% 
% xlabel('m_2')
% ylabel('m_3')
% title({'Location in parameter space'});
% axis equal;
% end
% 
% function plotMPH(m2_s, m3_s, H1_s, H2_s, s1, s2, Q)
% %%% Plot M-P instabilities in H
% 
% k = 1;
% 
% m2 = m2_s;
% m3 = m3_s;
% 
% N = 201;
% dH = 1/(N-1);
% H = 0:dH:1;
% 
% eigenvaluesG = nan(N,N);
% eigenvaluesDR = nan(N,N);
% 
% for i = 1:N-1
%     for j = i+1:N
%         eigenvaluesG(i,j) = eigG(H(i),H(j),m2,m3,s1,s2,Q);
%         eigenvaluesDR(i,j) = eigDR(k,H(i),H(j),m2,m3,s1,s2,Q);
%     end
% end
% 
% hold on;
% bin_map = [1   1   1
%     0.5 0.5 0.5];
% colormap(bin_map)
% imagesc(H,H,eigenvaluesDR','alphadata',~isnan(eigenvaluesDR'));
% set(gca,'YDir','normal');
% 
% [X, Y] = meshgrid(H,H);
% contour(X,Y,eigenvaluesG',1,'k');
% 
% plot(H1_s,H2_s,'xk');
% 
% xlabel('H_1')
% ylabel('H_2')
% %zlabel('Largest Real part of the Eigenvalues.');
% title({'Location in parameter space'})
% %colorbar
% axis equal;
% end