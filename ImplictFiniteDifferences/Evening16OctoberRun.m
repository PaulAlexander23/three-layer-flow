% Driver for the numerical methods

clear;

t_final = 32;
t_count = 2^8;
t = linspace(0,t_final,t_count)';

x_length = 2*pi;
x_count = 2^8;
x_step = x_length/x_count;
x = linspace(x_step, x_length, x_count)';

% Set Up Finite Differences
InitialiseFiniteDifferences(length(x),x(2)-x(1),4)

C = zeros(5,81);
% C = [Q, sigma_1, sigma_2, mu_2, mu_3];

values = 2.^(-1:1);
C(1,:) = 1;
for i = 2:5
    for j = 1:3^(i-1)
        for k = 1:3
            C(i,k:k+3^(5-i)) = values(1+mod(k-1+j,3));
        end
    end
end

for n = 1:size(C,2)
    
    func = @(t,y) f_full_problem(y, C);
    inter = i_double_cos(x, H_1, H_2,0.01,pi/2,x_length);
    
    tic;
    [t, h] = ode2b(func, t, inter);
    time = toc;
    
    filename = sprintf(sprintf('data/output/evening16october/data-x-%g-t-%g-h-%g-%g-mu-%g-%g-s-%g-%g-Q-%g.mat',x_length,t_final,H_1,H_2,mu_2,mu_3,sigma_1,sigma_2,Q));
    save(filename);
    
end