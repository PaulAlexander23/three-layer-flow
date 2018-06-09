function data_save(h,t,x,timeTaken,xN,xL,H1,H2,m2,m3,s1,s2,Q)

    save(sprintf('data-h-%g-%g-m-%g-%g-s-%g-%g-Q-%g-xN-%g-tF-%g-xL-%g.mat',...
        H1,H2,m2,m3,s1,s2,Q,xN,ceil(xL),ceil(t(end))));

end
