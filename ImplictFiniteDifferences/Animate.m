function Animate(h,t,x,x_length,t_final)
% Animate interfaces

axes = [0,x_length,0,1];

plot(x,h(1:end/2,1));
hold on
plot(x,h(end/2+1:end,1));
hold off

xlabel('x')
ylabel('y')
axis(axes)
pause(1)

for it = 2:length(t)
    plot(mod(x+1.2*t(it),x_length),h(1:end/2,it),'.');
    hold on
    plot(mod(x+1.2*t(it),x_length),h(end/2+1:end,it),'.');
    hold off
    xlabel('x')
    ylabel('y')
    axis(axes)
    %fprintf('%g \n', t(it))
    pause((t(it)-t(it-1)))
end
end