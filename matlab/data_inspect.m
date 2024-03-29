%DATA_INSPECT A script to plot the data generated by multiple runs of the numerical solver

addpath('../compute/','../plots')

folder_name = uigetdir;

files = dir([folder_name,'/*.mat']);

for i = 1:length(files)
    S = load([folder_name,'/',files(i).name]);

    fprintf(1,'H1: %f, H2: %f, m2: %f, m3: %f, s1: %f, s2: %f. Q: %f\n',S.H1,S.H2,S.m2,S.m3,S.s1,S.s2,S.Q);
    omega = compute_dispersion_relation(1,S.H1,S.H2,S.m2,S.m3,S.s1,S.s2,S.Q)';
    fprintf('Dispersion Relation: w+(1) = %f%+fi, w-(1) = %f%+fi\n',omega(1),omega(1)/1i,omega(2),omega(2)/1i);

    %plot_regions(S.h,S.t,S.x,S.Q,S.H1,S.H2,S.m2,S.m3);

    figure('position',[1120,0,560,420])
    plot_log_l2_norm(S.h,S.t,S.x);

    figure('position',[560,0,560,420])
    plot_interfaces(S.x,S.h(:,end),S.H1,S.H2)

    figure('position',[0,0,560,420])
    plot_interfaces(S.x,S.h(:,1),S.H1,S.H2)

    %figure('position',[0,0,560,420])
    %plot_l1_norm(S.h,S.t,S.x)

    figure('position',[1120,560,560,420])
    plot_dispersion_relation_varying_mu(S.H1,S.H2,S.m2,S.m3,S.s1,S.s2,S.Q);

    figure('position',[560,560,560,420])
    plot_dispersion_relation_varying_h(S.H1,S.H2,S.m2,S.m3,S.s1,S.s2,S.Q);

    figure('position',[0,560,560,420])
    plot_dispersion_relation(S.H1,S.H2,S.m2,S.m3,S.s1,S.s2,S.Q,1);

    commandwindow;

    pause;
    close all;
    clear S;
end
