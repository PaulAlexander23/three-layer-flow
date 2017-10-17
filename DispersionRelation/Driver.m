%%%
%%% Driver for the Dispersion Relation Section
%%%

sigma_1 = 1;
sigma_2 = 1;
Q = 1;

%% Stable

H_1 = 0.5;
H_2 = 0.7;
mu_2 = 0.9;
mu_3 = 0.8;

figure;
subplot(2,2,[1,2]);
PlotDispersionRelation(H_1, H_2, mu_2, mu_3, sigma_1, sigma_2, Q, 1);

subplot(2,2,3);
PlotVaryingMu(H_1, H_2, mu_2, mu_3, sigma_1, sigma_2, Q);

subplot(2,2,4);
PlotVaryingH(H_1, H_2, mu_2, mu_3, sigma_1, sigma_2, Q);
% print -depsc plots\DR_stable

%% M-P instability

H_1 = 0.5;
H_2 = 0.6;
mu_2 = 0.3;
mu_3 = 0.8;

figure;
subplot(2,2,[1,2]);
PlotDispersionRelation(H_1, H_2, mu_2, mu_3, sigma_1, sigma_2, Q, 1);

subplot(2,2,3);
PlotVaryingMu(H_1, H_2, mu_2, mu_3, sigma_1, sigma_2, Q);

subplot(2,2,4);
PlotVaryingH(H_1, H_2, mu_2, mu_3, sigma_1, sigma_2, Q);
% print -depsc plots\DR_mp

%% Unstable

C = [0.5, 0.25, 0.5, 0.7];

H_1 = 0.5;
H_2 = 0.7;
mu_2 = 0.5;
mu_3 = 0.25;
% H_1 = 0.5;
% H_2 = 0.7;
% mu_2 = 0.65;
% mu_3 = 0.25;

figure;
subplot(2,2,[1,2]);
PlotDispersionRelation(H_1, H_2, mu_2, mu_3, sigma_1, sigma_2, Q, 2);

subplot(2,2,3);
PlotVaryingMu(H_1, H_2, mu_2, mu_3, sigma_1, sigma_2, Q);

subplot(2,2,4);
PlotVaryingH(H_1, H_2, mu_2, mu_3, sigma_1, sigma_2, Q);
% print -depsc plots\DR_unstable
