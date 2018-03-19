c = 60/t(end);

fr = 30;
%v = VideoWriter('~/Drive/Postgrad/strong_surface_tension/plots/thin_middle_film_1','mp4');
%v = VideoWriter('thin_middle_film_1');
v = VideoWriter('thin_upper_film_1');
%v = VideoWriter('near_symmetric_1');
v.FrameRate = fr;


F1 = griddedInterpolant({x, t}, h(1:end/2,:));
F2 = griddedInterpolant({x, t}, h(1+end/2:end,:));

tNew = 0:1/fr/c:t(end);
%tNew = t;
temp = 1;
xNew = x(temp:temp:end);

hNew = [F1({xNew,tNew}); F2({xNew,tNew})];

open(v);

axis([0,2*pi,0,1]);
set(gcs,'nextplot','replaceshildren');

for tI = 1:1:length(tNew)
    plot_interfaces(xNew,hNew(:,tI),H1,H2);
    title(sprintf("Plot of the interfaces at time t = %6.1fs",tNew(tI)));
    frame = getframe(gcf);
    writeVideo(v,frame);
end

close(v);