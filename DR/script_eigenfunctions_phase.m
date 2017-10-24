%%%
%%% Script for finding regions where the eigen functions are in phase
%%%

k = 0.1;

H1 = 0.5;
H2 = 0.6;
s1 = 1;
s2 = 1;
Q = 1;

nm = 201;
m = linspace(0,2,nm);
r = nan(nm,nm);
eigenvaluesDR = nan(nm,nm);

for i = 2:nm
    for j = 2:nm
        r(i,j) = compute_ratio(k,H1,H2,m(i),m(j),s1,s2,Q);
        eigenvaluesDR(i,j) = max(real(compute_dispersion_relation(k,H1,H2,m(i),m(j),s1,s2,Q)));
    end 
end

figure;
hold on;
colormap('jet')
imagesc(m,m,eigenvaluesDR');
set(gca,'YDir','normal');

[X, Y] = meshgrid(m,m);
contour(X,Y,real(r'),[0,0],'w');

xlabel('m_2')
ylabel('m_3')
title({'A plot to show the regions of instability,',' Red/Blue: Disperion Relation k=0.1, white: real(ratio) of is zero on the line'});

figure;
hold on;
colormap('jet')
imagesc(m,m,eigenvaluesDR');
set(gca,'YDir','normal');

[X, Y] = meshgrid(m,m);
contour(X,Y,imag(r'),[0,0],'w');

xlabel('m_2')
ylabel('m_3')
title({'A plot to show the regions of instability,',' Red/Blue: Disperion Relation k=0.1, white: imag(ratio) of is zero on the line'});
