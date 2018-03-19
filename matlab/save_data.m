function save_data(h,x,t,timeTaken,xN,tF,H1,H2,m2,m3,s1,s2,Q)
    
    save(sprintf('data-x-%g-t-%g-h-%g-%g-mu-%g-%g-s-%g-%g-Q-%g.mat',...
        xN,tF,H1,H2,m2,m3,s1,s2,Q));
    
end

