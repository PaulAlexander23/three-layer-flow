function [sol,x,t] = compute_linear_solution(H1, H2, m2, m3, s1, s2, Q, inter, tL, tN, xL, xN)
    
    t = linspace(0,tL,tN);
    xS = xL/xN;
    x = linspace(xS,xL,xN)';
    
    sol = zeros(xN*2,tN);
    
    y = inter(x);
    
    plot_interfaces(x,y,H1,H2);
    
    % Taking fourier transform
    y1f = fft(y(1:end/2));
    y2f = fft(y(1 + end/2:end));
    
    N = size(y1f,1)/2;
    %amp1 = abs(yf1(1:N + 1)/N);
    %amp2 = abs(yf1(1:N + 1)/N);
    
    for j = 2:4
        
        % Modes
        k = [0:N-1, 0, 1-N:-1]';
        
        % Isolating mode j-1
        y1m = y1f;
        y1m(k~=j-1 & -k~=j-1) = 0;
        y2m = y2f;
        y2m(k~=j-1 & -k~=j-1) = 0;
        
        % Amplitudes
        amp = [sum(y1m),sum(y2m)]/N/i;
        
        % Transforming back into real space
        yff = [ifft(y1m);...
            ifft(y2m)];
        
        % Computing eigenfunctions
        [eigFunc, lambda] = compute_eigenfunctions(x, H1, H2, m2, m3, s1,s2, Q, amp,j-1);
        
        % Solving for the amplitudes of the eigenfunctions
        a = yff \ eigFunc
        
        
        figure
        plot_interfaces(x,yff,H1,H2);
        
        figure
        plot_interfaces(x,eigFunc(:,1),H1,H2);
        figure
        plot_interfaces(x,eigFunc(:,2),H1,H2);
        
        figure
        plot_interfaces(x,eigFunc*a',H1,H2);
        
        % Adding to the solution
        sol = sol + ( eigFunc * (diag(a)*exp(lambda * t) ));
    end
    
end