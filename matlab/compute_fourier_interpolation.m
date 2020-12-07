function [xNew, yNew] = compute_fourier_interpolation(x, y, xN)

    xNew = linspace(x(end)/xN, x(end), xN)';

    N = (length(y)-1)/2;

    h1 = y(1:N);
    h2 = y(1+N:2*N);

    h1New = interpft(h1, xN);
    h2New = interpft(h2, xN);

    yNew = [h1New; h2New; y(end)];

end
