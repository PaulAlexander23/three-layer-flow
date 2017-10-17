
Q = 1;
sigma_1 = 1;
sigma_2 = 1;
mu_2 = 0.05;
mu_3 = 0.15;
H_1 = 0.46;
H_2 = 0.54;

save(sprintf('data/parameters/ic-h-%g-%g-mu-%g-%g-s-%g-%g-Q-%g.mat',Q,sigma_1,sigma_2,mu_2,mu_3,H_1,H_2),'Q','sigma_1','sigma_2','mu_2','mu_3','H_1','H_2')
