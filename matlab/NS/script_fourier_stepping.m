

tL = 10;
c = 1;

xN = 2^6;
xL = 2*pi;
x = linspace(xL/xN,xL,xN)';

y0 = i_single_cos(x, 0.1, 1);
yf0 = fft(y0);

N = size(yf0,1)/2;
k = [0:N-1, 0, 1-N:-1]';

yfn0 = yf0([2:N,N+2:end]);

[t, yfn] = ode45(@(t,y) f(t,y,c),[0 tL],yfn0);

yfn = yfn';

yf = [zeros(1,length(t)); yfn(1:N,:); zeros(1,length(t)); yfn(N+1:end,:)];

y = ifft(yf);

figure;

[T,X] = meshgrid(t,x);

surface(X,T,real(y));

function dyfn = f(t, yfn, c)
    
    yfn(abs(yfn)<1e-13) = 0;
    
    N = size(yfn,1)/2 + 1;
    
    k = [1:N-1, 1-N:-1]';
    
    d1yfn = 1i*k.*yfn;
    
    yf = [0; yfn(1:N); 0; yfn(N+1:end)];
    d1yf = [0; d1yfn(1:N); 0; d1yfn(N+1:end)];
    
    y = ifft(yf);
    d1y = ifft(d1yf);
    
    dy = -c*y.*d1y;
    
    dyf = fft(dy);
    
    dyfn = dyf([2:N,N+2:end]);
    
end