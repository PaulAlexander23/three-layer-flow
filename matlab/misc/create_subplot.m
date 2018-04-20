
figure('Position',[100,50,1280,800])
subplot(1,3,[1 2]);
hold on;
plot_stability_h(1,m2,m3,s1,s2,Q);
plot_h_h_space(h(:,end),H1,H2);
plot(H1,H2,'wx');
plot([0,1],[0,1],'r')
colorbar('off')
title({'The linear instabilities in parameter space','with the final state of the numerical solution overlaid.'})


subplot(1,3,3);
plot_stability_regions_in_time(h,t,x,H1,H2,m2,m3,s1,s2,Q);

print('temp_1.svg','-dsvg')