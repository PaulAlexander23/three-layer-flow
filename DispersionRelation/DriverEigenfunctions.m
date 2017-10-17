%%%
%%% Driver for finding regions where the eigen functions are in phase
%%%


k = 0.1;
s1 = 1;
s2 = 1;

H1 = 0.5;
H2 = 0.6;

N = 201;
dM = 1/(N-1);
M = 0:dM:1;
r = nan(N,N);
eigenvaluesDR = nan(N,N);

for i = 2:N
    for j = 2:N
        r(i,j) = Ratio(k,H1,H2,M(i),M(j),s1,s2,Q);
        eigenvaluesDR(i,j) = eigDR(k,H1,H2,M(i),M(j),s1,s2,Q);
    end 
end

figure;
hold on;
colormap('jet')
imagesc(M,M,eigenvaluesDR');
set(gca,'YDir','normal');

[X, Y] = meshgrid(M,M);
contour(X,Y,real(r'),[0,0],'w');

xlabel('m_2')
ylabel('m_3')
title({'A plot to show the regions of instability,',' Red/Blue: Disperion Relation k=0.1, white: real(ratio) of is zero on the line'});

figure;
hold on;
colormap('jet')
imagesc(M,M,eigenvaluesDR');
set(gca,'YDir','normal');

[X, Y] = meshgrid(M,M);
contour(X,Y,imag(r'),[0,0],'w');

xlabel('m_2')
ylabel('m_3')
title({'A plot to show the regions of instability,',' Red/Blue: Disperion Relation k=0.1, white: imag(ratio) of is zero on the line'});


