function plot_amp2(H1,H2,m2,m3,s1,s2,Q)
    
    
%     H1 = 0.5;
%     H2 = 0.6;
%     m2 = 0.5;
%     m3 = 0.25;
%     s1 = 1.0;
%     s2 = 1.0;
%     Q = 1.0;
    
    % H1 = 0.3;
    % H2 = 0.85;
    % m2 = 0.5;
    % m3 = 0.25;
    % s1 = 1.0;
    % s2 = 1.0;
    % Q = 1.0;
    
    % H1 = 0.6;
    % H2 = 0.95;
    % m2 = 2;
    % m3 = 0.5;
    % s1 = 1.0;
    % s2 = 1.0;
    % Q = 1.0;
    
    %k = 1;
    
    zN = 801;
    z0 = 0.01;
    z1 = 10;
    z = linspace(z0,z1,zN);
    
    w = zeros(zN,1);
    amp = zeros(zN,1);
    phi = zeros(zN,1);
    
    for j = 1:zN
        [e,V] = compute_dispersion_relation(z(j),H1,H2,m2,m3,s1,s2,Q);
        w(j) = e(1);
        amp(j) = abs(V(2,1))/abs(V(1,1));
        phi(j) = mod(angle(V(2,1)) - angle(V(1,1))+pi,2*pi)-pi;
    end
    
    % plot(z,real(w),z,zeros(size(z)),'k');
    % title('Growth rate against k');
    % xlabel('k');
    % ylabel('Growth rate');
    
    fig = figure('position',[680,558,5*80,5*60]);
    left_color = [0 0 0];
    right_color = [0 0 0];
    set(fig,'defaultAxesColorOrder',[left_color; right_color]);
    
    plot(z,amp,'k');%,z,ones(size(z)),'k');
    %title('Amplitude ratio, \eta_2/\eta_1, against k');
    %title('Amplitude ratio, \eta_2/\eta_1, and Phase shift of \eta_2 from \eta_1 against k');
    xlabel('k');
    ylabel('Amplitude ratio');
    
    
    yyaxis right
    
    plot(z,phi,'k--');%,z,zeros(size(z)),'k');
    %title('Phase shift of \eta_2 from \eta_1 against k');
    %xlabel('k');
    ylabel('Phase shift');
    legend('Amp','Shift','Location','southeast')

    
    % Slice
    
    %ks = 1;
    %hold on;
    %plot([ks,ks],ylim);
    %plot_eigenfunctions(0.5,ks,H1,H2,m2,m3,s1,s2,Q);
end