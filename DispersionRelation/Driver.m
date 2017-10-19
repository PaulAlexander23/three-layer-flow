%%%
%%% Driver for the Dispersion Relation Section
%%%

s1 = 1;
s2 = 1;
Q = 1;

%% Stable

H1 = 0.5;
H2 = 0.7;
m2 = 0.9;
m3 = 0.8;

figure;
subplot(2,2,[1,2]);
PlotDispersionRelation(H1, H2, m2, m3, s1, s2, Q, 1);

subplot(2,2,3);
PlotVaryingMu(H1, H2, m2, m3, s1, s2, Q);

subplot(2,2,4);
PlotVaryingH(H1, H2, m2, m3, s1, s2, Q);
% print -depsc plots\DR_stable

%% M-P instability

H1 = 0.5;
H2 = 0.6;
m2 = 0.3;
m3 = 0.8;

figure;
subplot(2,2,[1,2]);
PlotDispersionRelation(H1, H2, m2, m3, s1, s2, Q, 1);

subplot(2,2,3);
PlotVaryingMu(H1, H2, m2, m3, s1, s2, Q);

subplot(2,2,4);
PlotVaryingH(H1, H2, m2, m3, s1, s2, Q);
% print -depsc plots\DR_mp

%% Unstable

C = [0.5, 0.25, 0.5, 0.7];

H1 = 0.5;
H2 = 0.7;
m2 = 0.5;
m3 = 0.25;
% H_1 = 0.5;
% H_2 = 0.7;
% mu_2 = 0.65;
% mu_3 = 0.25;

figure;
subplot(2,2,[1,2]);
PlotDispersionRelation(H1, H2, m2, m3, s1, s2, Q, 2);

subplot(2,2,3);
PlotVaryingMu(H1, H2, m2, m3, s1, s2, Q);

subplot(2,2,4);
PlotVaryingH(H1, H2, m2, m3, s1, s2, Q);
% print -depsc plots\DR_unstable
