% Short script to test the interpolation function

xOld = 0:pi/8:2*pi;
yOld = cos(xOld);

xNew = 0:pi/24:2*pi;
yNew = interp1(xOld,yOld,xNew);

plot(xOld,yOld,xNew,yNew,'o')

F = griddedInterpolant(xOld,yOld);

yNew2 = F(xNew);

hold on;
plot(xNew,yNew2,'x')


%%

F1 = griddedInterpolant({x, t}, h(1:end/2,:));
F2 = griddedInterpolant({x, t}, h(1+end/2:end,:));

tNew = linspace(0,t(end),400);
temp = 2;
xNew = x(temp:temp:end);

hNew = [F1({xNew,tNew}); F2({xNew,tNew})];

plot_stability_regions_in_time(hNew,tNew,xNew,C(i,1),C(i,2),C(i,3),C(i,4),s1,s2,Q)
