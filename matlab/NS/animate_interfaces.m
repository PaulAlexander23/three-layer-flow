function animate_interfaces(y,t,x, H1, H2)
%animate_interfaces Animation of the interfaces

axes = [0,x(end),0,1];

plot(x,H1 + y(1:end/2,1));
hold on
plot(x,H2 + y(end/2+1:end,1));
hold off

xlabel('x')
ylabel('y')
axis(axes)
pause(1)

for it = 2:length(t)
    plot(x,H1 + y(1:end/2,it));
    %plot(mod(x+1.2*t(it),x(end)),H1 + y(1:end/2,it),'.');
    hold on
    plot(x,H2 + y(end/2+1:end,it));
    %plot(mod(x+1.2*t(it),x(end)), H2 + y(end/2+1:end,it),'.');
    hold off
    xlabel('x')
    ylabel('y')
    axis(axes)
    %fprintf('%g \n', t(it))
    pause(0.1*(t(it)-t(it-1)))
end
end