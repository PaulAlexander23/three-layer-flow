%%%
%%% Driver for the Dispersion Relation Section
%%%

addpath('DispersionRelation\')

% s1 = 1;
% s2 = 1;
% Q = 1;
% 
% H1 = 0.46;
% H2 = 0.54;
% m2 = 0.05;
% m3 = 0.15;

figure;
subplot(2,2,[1,2]);
PlotDispersionRelation(H1, H2, m2, m3, s1, s2, Q, 3);

subplot(2,2,3);
PlotVaryingMu(H1, H2, m2, m3, s1, s2, Q);

subplot(2,2,4);
PlotVaryingH(H1, H2, m2, m3, s1, s2, Q);
%print -depsc plots\DR_unstable
