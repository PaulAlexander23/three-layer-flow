%% Save Data

filename = sprintf(sprintf('data/output/data-x-%g-t-%g-h-%g-%g-mu-%g-%g-s-%g-%g-Q-%g.mat',x_length,t_final,H_1,H_2,mu_2,mu_3,sigma_1,sigma_2,Q));
save(filename,'h','x','t','Q','sigma_1','sigma_2','mu_2','mu_3','H_1','H_2','x_length','t_final');