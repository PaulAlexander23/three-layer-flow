function [h,t,x] = load_data(xN,tF,H1,H2,m2,m3,s1,s2,Q)
    
    load(sprintf('data-x-%g-t-%g-h-%g-%g-mu-%g-%g-s-%g-%g-Q-%g.mat',...
        xN,tF,H1,H2,m2,m3,s1,s2,Q),'h','t','x');
    
end

