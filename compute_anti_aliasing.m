function yF = compute_anti_aliasing(xF, r)
    
    if nargin < 2
       r = 1/3; 
    end
    
    N = size(xF,1)/2;
    
    K = ceil(N*r);
    
    yF = zeros(2*N,size(xF,2));
    
    yF([2:K+2,end-K:end],:) = xF([2:K+2,end-K:end],:);
    
end