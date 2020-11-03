function filename = data_filename(xN, xL, t, H1, H2, m2, m3, s1, s2, Q)

    filename = sprintf('data-h-%g-%g-m-%g-%g-s-%g-%g-Q-%g-xN-%g-xL-%g-tF-%g.mat',...
        H1,H2,m2,m3,s1,s2,Q,xN,ceil(xL),ceil(t(end)));
end
