function h = i_double_rand(x, a)
    nModes = 5;
    r = rand(1,2*nModes).*[nModes:-1:1,nModes:-1:1,].^8;
    t = rand(1,2*nModes)*2.0*pi;
    
    h = (r.*cos(x*[1:nModes,1:nModes] + t))*kron(eye(2),ones(nModes,1));
    h = a * h ./ max(max(abs(h)));
    h = [h(:,1);h(:,2)];
end