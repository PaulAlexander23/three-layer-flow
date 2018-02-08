function c = scatter_with_lobf(x, y)
    %SCATTER_WITH_LOBF A scatter plot with the line of best fit.
    % Returns the values of the linear regression coefficients.
    L = length(x);
    x = reshape(x,L,1);
    X = [ones(L,1) x];
    c = X\y;
    scatter(x,y);
    hold on
    plot(x,X*c);
end