
[h,x,t] = compute_numerical_solution(0.5,0.6,0.5,2,1,1,0.1,@(x) i_double_rand(x,0.05,2*pi,10,0),400,2*pi,100);
[h2,x2,t2] = compute_numerical_solution(0.5,0.6,0.5,2,1,1,0.1,@(x) i_double_rand(x,0.05,2*pi,10,0),400,2*pi,102);
h2 = compute_interpolation(h2,t2,x2,t,x);
clear x2 t2
%%
index = length(t);
plot_spectrum(x,h(:,index))
hold on;
plot_spectrum(x,h2(:,index))
hold on;
plot_spectrum(x,h(:,index)-h2(:,index));