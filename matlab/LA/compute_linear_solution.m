function [sol,x,t] = compute_linear_solution(H1, H2, m2, m3, s1, s2, Q, inter, tL, tN, xL, xN)
    
    t = linspace(0,tL,tN);
    
    xS = xL/xN;
    x = linspace(xS,xL,xN)';
    
    sol = zeros(xN*2,tN);
    
    y = inter(x);
    
    %plot_interfaces(x,y,H1,H2);
    
    % Taking fourier transform
    y1f = fft(y(1:end/2));
    y2f = fft(y(1 + end/2:end));
    
    N = size(y1f,1)/2;
    
    for k = 1:5 %N-1
        % Isolate kth mode
        a = [y1f(1+k), y2f(1+k)];
        
        % Set up dispersion relation matrix
        M = -1i*k*compute_g_linear(H1, H2, m2, m3, Q) + ...
            k^4*compute_f_linear(H1, H2, m2, m3, s1, s2);
        
        % Compute eigenvalues and eigenfunctions
        [V, lambda] = eig(M,'vector');
        
        % Compute coefficients of the eigenfunctions. THESE SHOULD BE THE SAME
        b = a / V;
        
        % Construct solution in Fourier space
        y1mf = zeros(2*N,tN);
        y2mf = zeros(2*N,tN);
        
        % Coefficients times the appropriate eigenfunction with growth
        y1mf(1+k,:) = b * (V(1,:)' .* exp(lambda * t));
        y2mf(1+k,:) = b * (V(2,:)' .* exp(lambda * t));
        
        % Add complex conjugate
        y1mf(2*N-k+1,:) = conj(y1mf(1+k,:));
        y2mf(2*N-k+1,:) = conj(y2mf(1+k,:));
        
        % Convert back to real space
        y1m = ifft(y1mf);
        y2m = ifft(y2mf);
        
        y1ff = zeros(2*N,1);
        y1ff([1+k,2*N-k+1]) = [y1f(1+k), y1f(2*N-k+1)];
        
        figure;
        plot(x, ifft(y1ff), x, y1m(:,1));
        
        % Adding to the solution
        sol = sol + [y1m;y2m];
    end
    
    
    figure;
    plot_interfaces(x,y,0.4,0.7)
    hold on
    plot_interfaces(x,sol(:,1),0.4,0.7)
    
end