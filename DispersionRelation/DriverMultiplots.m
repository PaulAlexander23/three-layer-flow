%%%
%%% Driver for plotting multiple stability regions
%%%

close all;

s1 = 1;
s2 = 1;
Q = 1;
k = 0.1;

%% Plot Stability - Symmetric H

N = 201;
dM = 1/(N-1);
M = 0:dM:1;
eigenvaluesG = zeros(N,N);
eigenvaluesDR = zeros(N,N);


aN = 6;
a = linspace(0.415,0.49,6);

figure;
for ai = 1:aN
    H1 = a(ai);
    H2 = 1-a(ai);
    
    for i = 2:N
        for j = 2:N
            eigenvaluesG(i,j) = eigG(H1,H2,M(i),M(j),s1,s2,Q);
            eigenvaluesDR(i,j) = eigDR(k,H1,H2,M(i),M(j),s1,s2,Q);
        end 
    end

    subplot(3,2,ai)
    hold on;
    bin_map = [1   1   1
               0.5 0.5 0.5];
    colormap(bin_map)
    imagesc(M,M,eigenvaluesDR','alphadata',~isnan(eigenvaluesDR'));
    set(gca,'YDir','normal');

    [X, Y] = meshgrid(M,M);
    contour(X,Y,eigenvaluesG',1,'k');
        xlabel('m_2')
    ylabel('m_3')
    title(['H1 = ',num2str(H1),', H2 = ', num2str(H2)]);
    axis equal;
    axis([0,1,0,1]);
    caxis([0,1])
    colorbar('ticks',[0,1],'TickLabels',{'Stable', 'Unstable'})
    
end

print -depsc plots\multi_sym_H

%% Plot Stability - Symmetric mu

m3 = 1;

N = 201;
dH = 1/(N-1);
H = 0:dH:1;

aN = 6;
%a = [0.001,linspace(0.2,1,5)];
a = [0.05,0.2,0.5,0.8,0.95,1];
figure;
for ai = 1:aN
    m2 = a(ai);
    
    eigenvaluesG = nan(N,N);
    eigenvaluesDR = nan(N,N);

    for i = 1:N-1
        for j = i+1:N
            eigenvaluesG(i,j) = eigG(H(i),H(j),m2,m3,s1,s2,Q);
            eigenvaluesDR(i,j) = eigDR(k,H(i),H(j),m2,m3,s1,s2,Q);
        end 
    end

    subplot(3,2,ai)
    hold on;
    bin_map = [1   1   1
               0.5 0.5 0.5];
    colormap(bin_map)
    imagesc(H,H,eigenvaluesDR','alphadata',~isnan(eigenvaluesDR'));
    set(gca,'YDir','normal');

    [X, Y] = meshgrid(H,H);
    contour(X,Y,eigenvaluesG',1,'k');
        xlabel('H_1')
    ylabel('H_2')
    title(['m_2 = ',num2str(m2)]);
    axis equal;
    axis([0,1,0,1]);

end

print -depsc plots\multi_sym_mu