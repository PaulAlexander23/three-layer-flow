function data_save(h,t,x,timeTaken,xN,xL,H1,H2,m2,m3,s1,s2,Q)

    filename = sprintf("data-h-%.2f-%.2f-m-%.2f-%.2f-s-%g-%g-Q-%g-xN-%d-xL-%.1f-tF-%.1f",...
        H1,H2,m2,m3,s1,s2,Q,xN,xL,t(end));
    
    while(exist(filename + ".mat",'file'))
        filename = filename + 'a';
    end

    save(filename + ".mat");
end
