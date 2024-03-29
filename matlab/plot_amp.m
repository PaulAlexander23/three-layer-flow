function plot_amp(k,H1,H2,m2,s1,s2,Q)
    
    % H1 = 0.6;
    % H2 = 0.95;
    % m2 = 2;
    % %m3 = 3.1;
    % s1 = 1.0;
    % s2 = 1.0;
    % Q = 1.0;
    % k = 1;
    
    zN = 201;
    z0 = 0.1;
    z1 = 2;
    z = linspace(z0,z1,zN);
    
    w = zeros(zN,1);
    amp = zeros(zN,1);
    phi = zeros(zN,1);
    
    for j = 1:zN
        [e,V] = compute_dispersion_relation(k,H1,H2,m2,z(j),s1,s2,Q);
        w(j) = e(1);
        amp(j) = abs(V(2,1))/abs(V(1,1));
        phi(j) = imag(V(2,1)) - imag(V(1,1));
    end
    
    fig = figure('position',[680,558,5*80,5*60]);
    left_color = [0 0 0];
    right_color = [0 0 0];
    set(fig,'defaultAxesColorOrder',[left_color; right_color]);
    
    plot(z,amp,'k');
    xlabel('m_3');
    ylabel('Amplitude ratio');
    
    
    yyaxis right
    
    plot(z,phi,'k--');%,z,zeros(size(z)),'k');
    ylabel('Phase shift');
    legend('Amp','Shift')%,'Location','southeast')
    
%     plot(z,real(w),z,zeros(size(z)),'k');
%     title('Growth rate against m_3');
%     xlabel('m_3');
%     ylabel('Growth rate');
%     figure;
%     plot(z,amp,z,ones(size(z)),'k');
%     title('Amplitude ratio, \eta_2/\eta_1, against m_3');
%     xlabel('m_3');
%     ylabel('Amplitude ratio');
%     figure;
%     plot(z,phi,z,zeros(size(z)),'k');
%     title('Phase shift of \eta_2 from \eta_1 against m_3');
%     xlabel('m_3');
%     ylabel('Phase shift');
end