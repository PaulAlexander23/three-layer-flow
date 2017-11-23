%SCRIPT_EXPLORE_PHASE_SPACE Using the phase space and the qualitative changes
%in the linear analysis the nonlinear numerical solution is explored.

% Constant parameters
s1 = 1; s2 = 1; Q = 1;

%     H1,   H2,   m2,   m3;
C =[0.20, 0.40, 0.50, 1.00;
    0.40, 0.60, 0.50, 1.00;
    0.33, 0.40, 0.50, 1.00;
    0.42, 0.51, 0.50, 1.00];

for i = 1:size(C,1)
    figure('position',[0,0,1000,1000])
    plot_phase_space(C(i,1),C(i,2),C(i,3),C(i,4),s1,s2,Q);
end

function plot_phase_space(H1,H2,m2,m3,s1,s2,Q)
    
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
    
end