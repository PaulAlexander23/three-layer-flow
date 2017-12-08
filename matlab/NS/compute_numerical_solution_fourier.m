function [y,x,t] = compute_numerical_solution_fourier(H1, H2, m2, m3, s1, s2, Q, inter, tFinal, xL, xN, RelTol)
    %COMPUTE_NUMERImaCAL_SOLUTION Computes the numerical solution up to tFinal
    %   Detailed explanation goes here
    
    if nargin < 10
        xL = 2*pi;
    end
    if nargin < 11
        xN = 2^8;
    end
    if nargin < 12
        RelTol = 1e-3;
    end
    
    xS = xL/xN;
    x = linspace(xS, xL, xN)';
    
    y0 = inter(x);
    
    y0 = reshape(y0,size(y0,1)/2,size(y0,2)*2);
    
    y0f = fft(y0);
    
    N = size(y0f,1)/2;
    
    y0fn = y0f([2:N,N+2:end],:);
    
    y0fn = reshape(y0fn,size(y0fn,1)*2,size(y0fn,2)/2);
    
    options = odeset(...'Vectorized','on',...
        'BDF','on',... % Backward differentiation formulae
        ...'Event',@(t,y) event_collision(t,y,H1,H2),... % This needs to be changed
        'RelTol',RelTol,... % Default: 1e-3
        'AbsTol',1e-6);  % Default: 1e-6
    
    tic
    [t, yfn] = ode15s(@f, [0,tFinal], y0fn, options);
    toc
    
    yfn = yfn';
    
    yfn = reshape(yfn,size(yfn,1)/2,size(yfn,2)*2);
    
    yf = [zeros(1,2*length(t)); yfn(1:N,:); zeros(1,2*length(t)); yfn(N+1:end,:)];
    
    y = ifft(yf);
    
    y = reshape(y,size(y,1)*2,size(y,2)/2);
    
    %     if ~isempty(te)
    %         fprintf('Intersection detected at: %f\n',te)
    %     end
    
    function dyfn = diffArray(yfn, degrees)
        
        N = size(yfn,1)/2 + 1;
        
        k = [1:N-1, 1-N:-1]';
        
        dyfn = zeros([size(yfn),length(degrees)]);
        
        for n = 1:length(degrees)
            dyfn(:,:,n) = (1i*k).^degrees(n).*yfn;
        end
        
    end
    
    function dffn = f(t, yfn)
        
        yfn(abs(yfn)<1e-13) = 0;
        
        yfn = reshape(yfn, size(yfn,1)/2, size(yfn,2)*2);
        
        N = size(yfn,1)/2 + 1;
        
        dyfn = diffArray(yfn, [1,3,4]);
        
        yf = [zeros(1,size(yfn,2)); yfn(1:end/2,:);...
            zeros(1,size(yfn,2)); yfn(end/2+1:end,:)];
        dyf = [zeros(1,size(yfn,2),3); dyfn(1:N,:,:);...
            zeros(1,size(yfn,2),3); dyfn(N+1:end,:,:)];
        
        yt = real(ifft(yf)); % yt, not y as this makes it global
        dy = real(ifft(dyf));
        
        yCell = cell(1,2);
        dyCell = cell(4,2);
        yCell{1} = yt(1:end/2,:);
        yCell{2} = yt(1+end/2:end,:);
        dyCell{1,1} = dy(1:end/2,:,1);
        dyCell{1,2} = dy(1+end/2:end,:,1);
        dyCell{3,1} = dy(1:end/2,:,2);
        dyCell{3,2} = dy(1+end/2:end,:,2);
        dyCell{4,1} = dy(1:end/2,:,3);
        dyCell{4,2} = dy(1+end/2:end,:,3);
        
        df = compute_evolution(yCell,dyCell,H1,H2,m2,m3,s1,s2,Q);
        
        %df = reshape(df,size(df,1)/2,size(df,2)*2);
        
        dff = fft(df);
        
        dffn = dff([2:N,N+2:end],:);
        
        dffn = reshape(dffn,size(dffn,1)*2,size(dffn,2)/2);
        
    end
    
end