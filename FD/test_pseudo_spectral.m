% A short script to test the validity of the psuedo spectral differentiation
% against a simple exact case ( y = cos(x) )

fprintf('test_pseudo_spectral\n')

addpath('../IF/')

xN = 2.^(4:15);
xL = 2*pi;
xS = xL./xN;

hold on
for degree = 1:4
    error = compute_error(xN, xL, xS, degree);
    X = [ones(length(xN),1) log10(xN)'];
    b2 = X\log10(error);
    fprintf('Degree: %u, Gradient: %f \n',degree,b2(2));
    scatter(log10(xN),log10(error));
    plot(log10(xN),X*b2);
end

title({'A log - log plot of the error in the derivatives of y = cos(x)',' against number of points for the two schemes'})
xlabel('No of points, 10^x')
ylabel('Error, 10^y')

save('test_pseudo_spectral_results.mat')

function error = compute_error(xN,xL,xS,degree)
    error = ones(length(xN),1);
    for i = 1:length(xN)
        x = linspace(xS(i), xL, xN(i))';
        if degree == 1
            y = -sin(x);
        elseif degree == 2
            y = -cos(x);
        elseif degree == 3
            y = sin(x);
        else
            y = cos(x);
        end
        error(i) = max(abs(psd(cos(x),degree) - y ));
    end
end