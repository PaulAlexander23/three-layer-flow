%SCRIPT_EXPLORE_PHASE_SPACE Using the phase space and the qualitative changes
%in the linear analysis the nonlinear numerical solution is explored.

% Constant parameters
s1 = 1; s2 = 1; Q = 1;
H1 = 0.4; H2 = 0.6; m2 = 1; m3 = 1;


% Independent variable set up
xL = 2*pi;
xN = 2^8;
x = linspace(xL/xN,xL,xN)';

plot_dispersion_relation_varying_h(0.5,m3,s1,s2,Q)
figure
plot_type_for_all_h(0.3,H2,0.5,m3,Q)

figure
plot_phase_space(0.4,0.6,1,1,s1,s2,Q,x);

figure
plot_phase_space(0.4,0.6,0.5,1,s1,s2,Q,x);


function plot_phase_space(H1,H2,m2,m3,s1,s2,Q,x)
    
    plot_dispersion_relation_varying_h(m2,m3,s1,s2,Q);
    hold on;
    
    for a = 0:0.02:0.1
        y = i_double_cos(x,a,pi/2);
        
        plot_h_h_space(y,H1,H2);
    end
    
end