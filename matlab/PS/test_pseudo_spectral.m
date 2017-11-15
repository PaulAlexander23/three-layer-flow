% A short script to test the validity of the psuedo spectral differentiation
% against a simple exact case ( y = cos(x) )

fprintf('test_pseudo_spectral\n')

addpath('../IF/','../')

xN = 2.^(4:14)';
xL = 2*pi;
xS = xL./xN;


for degree = 1:4
    error = compute_error(xN, xL, xS, degree);
    plot_line_of_best_fit(log10(xN),log10(error));
end

title({'A log - log plot of the error in the derivatives of y = cos(x)',' against number of points for the two schemes'})
xlabel('No of points, 10^x')
ylabel('Error, 10^y')

save('test_pseudo_spectral_results.mat')

function error = compute_error(xN,xL,xS,degree)
    error = ones(length(xN),1);
    for i = 1:length(xN)
        x = linspace(xS(i), xL, xN(i))';
        y = cos(x);
        if degree == 1
            dy = -sin(x);
        elseif degree == 2
            dy = -cos(x);
        elseif degree == 3
            dy = sin(x);
        else
            dy = cos(x);
        end
        dY = diff_ps(y,degree,0.1);
        error(i) = max(abs(dY - dy ));
    end
end