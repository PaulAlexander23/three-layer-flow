%SCRIPT_EXPLORE_PHASE_SPACE Using the phase space and the qualitative changes
%in the linear analysis the nonlinear numerical solution is explored.

% Constant parameters
s1 = 0.1; s2 = 1; Q = 1;
tFinal = 500;

%     H1,   H2,   m2,   m3,    a;
%C =[0.28, 0.48, 0.50, 1.00, 0.05;
%    0.34, 0.42, 0.50, 1.00, 0.05];
m = 7;
C =[linspace(0.28,0.34,m);
    linspace(0.48,0.42,m);
    0.50*ones(1,m);
    1.00*ones(1,m);
    0.05*ones(1,m);]';

%%

for i = 1:size(C,1)
    figure('position',[0,0,1000,1000])
    plot_phase_space(C(i,1),C(i,2),C(i,3),C(i,4),s1,s2,Q,C(i,5));
end

%%

for i = 2%1:size(C,1)
    [h,x,t]=compute_numerical_solution(C(i,1),C(i,2),C(i,3),C(i,4),s1,s2,Q,...
        @(x) i_eigenfunction(x,C(i,1),C(i,2),C(i,3),C(i,4),s1,s2,Q,[C(i,5),C(i,5)],1,0),...
        tFinal,2*pi,2^8,1e-9);
    
    filename = sprintf('data/data-x-%g-t-%g-h-%g-%g-mu-%g-%g-s-%g-%g-Q-%g.mat',2^8,tFinal,C(i,1),C(i,2),C(i,3),C(i,4),s1,s2,Q);
    save(filename);
end


%%

for i = 1:size(C,1)-1
    filename = sprintf('data/data-x-%g-t-%g-h-%g-%g-mu-%g-%g-s-%g-%g-Q-%g.mat',2^8,tFinal,C(i,1),C(i,2),C(i,3),C(i,4),s1,s2,Q);
    load(filename);
    
    plot_overview(h,t,x,C(i,1),C(i,2),C(i,3),C(i,4),s1,s2,Q)
    
    pause()
    
    close all
end
% 1 stable
% 2 interesting
% 3 unstable
% 4 unstable
% 5 unstable
% 6 unstable
%%

function plot_phase_space(H1,H2,m2,m3,s1,s2,Q,a2)
    
    % Independent variable set up
    xL = 2*pi;
    xN = 2^8;
    x = linspace(xL/xN,xL,xN)';
    
    plot_dispersion_relation_varying_h(m2,m3,s1,s2,Q);
    hold on;
    plot(H1,H2,'+k')
    plot(H1,H2,'xw')
    
    for a = 0:0.02:0.1
        y = i_double_cos(x,a,pi/2);
        plot_h_h_space(y,H1,H2);
    end
    
    y = i_eigenfunction(x,H1,H2,m2,m3,s1,s2,Q,[a2,a2],1,0);
    plot_h_h_space(y,H1,H2);
end