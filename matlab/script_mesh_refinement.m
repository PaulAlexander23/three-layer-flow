

load('data/data-x-128-t-500-h-0.29-0.47-mu-0.5-1-s-0.1-1-Q-1.mat')

F1 = griddedInterpolant({x, t}, h(1:end/2,:));
F2 = griddedInterpolant({x, t}, h(1+end/2:end,:));

tNew = 0:1:t(end);
xNew = x;

h128 = [F1({xNew,tNew}); F2({xNew,tNew})];

load('data/data-x-256-t-500-h-0.29-0.47-mu-0.5-1-s-0.1-1-Q-1.mat')

F1 = griddedInterpolant({x, t}, h(1:end/2,:));
F2 = griddedInterpolant({x, t}, h(1+end/2:end,:));

h256 = [F1({xNew,tNew}); F2({xNew,tNew})];

error = h128 - h256;

plot_log_l2_norm(error,tNew,xNew);
ylim([-15 0])

figure
plot_log_l1_norm(h128,tNew,xNew);
ylim([-15 0])