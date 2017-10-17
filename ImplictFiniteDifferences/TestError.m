%Error testing

clear;

InitialiseTest;
C = [Q, sigma_1, sigma_2, mu_2, mu_3];


error = zeros(6,1);
time = zeros(6,1);

t_final = 1;
x_length = 2*pi;


t_count = 2^6;
t = linspace(0,t_final,t_count)';
x_count = 2^5;
x_step = x_length/x_count;
x = linspace(x_step/2, x_length - x_step/2, x_count);
func = @(t,y) f_full_problem(y, C);
inter = i_double_cos(x, H_1, H_2,0.1,-pi/2,x_length);
tic
h_app =  pde2b4(func, t, x, inter);
time(6) = toc;
error(6) = 0;
fprintf('i = 6, error = -, t = %g\n',time(6));


for i = 1:5
    %for j = 1:5
    t_count = 2^i;
    t = linspace(0,t_final,t_count)';
    %inter = i_double_cos(x, H_1, H_2,0.1,-pi/2,x_length);
    
    tic
    [h, x, t] = pde2b4(func, t, x, inter);
    time(i) = toc;
    
    error(i) = norm(h(end,:)-h_app(end,:));
    
    fprintf('i = %g, error = %g, t = %g\n',i,error(i),time(i));
    %end
end

beep

%save('pde2b4errorcost1to7x7','time','error')