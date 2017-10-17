%%%
%%% Driver for the Dispersion Relation Section
%%%

addpath('DispersionRelation\')

% sigma_1 = 1;
% sigma_2 = 1;
% Q = 1;
% 
% H_1 = 0.46;
% H_2 = 0.54;
% mu_2 = 0.05;
% mu_3 = 0.15;

figure;
subplot(2,2,[1,2]);
PlotDispersionRelation(H_1, H_2, mu_2, mu_3, sigma_1, sigma_2, Q, 3);

subplot(2,2,3);
PlotVaryingMu(H_1, H_2, mu_2, mu_3, sigma_1, sigma_2, Q);

subplot(2,2,4);
PlotVaryingH(H_1, H_2, mu_2, mu_3, sigma_1, sigma_2, Q);
%print -depsc plots\DR_unstable
