function h = i_double_rand(x, a)
    
    r = rand(1,10);
    t = rand(1,10)*2.0*pi;
    
    h = (r.*cos(x*[1:5,1:5] + t))*kron(eye(2),ones(5,1));
    h = a * h ./ max(max(abs(h)));
    h = [h(:,1);h(:,2)];
end