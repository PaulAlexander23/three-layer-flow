
Q = 1;
s1 = 1;
s2 = 1;
m2 = 0.05;
m3 = 0.15;
H1 = 0.46;
H2 = 0.54;

save(sprintf('data/parameters/ic-H-%g-%g-m-%g-%g-s-%g-%g-Q-%g.mat',H1,H2,m2,m3,s1,s2,Q),'Q','s1','s2','m2','m3','H1','H2')
