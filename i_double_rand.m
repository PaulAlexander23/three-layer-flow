function h = i_double_rand(x, a, xL, mN, seed)
    if nargin > 4
        rng(seed);
    end
    
    r = rand(1,mN*2);
    t = rand(1,mN*2)*2.0*pi;
    
    h = (r.*cos(2*pi/xL*(x*[1:mN,1:mN] + t)))*kron(eye(2),ones(mN,1));
    h = a * h ./ max(max(abs(h)));
    h = [h(:,1);h(:,2)];
end
