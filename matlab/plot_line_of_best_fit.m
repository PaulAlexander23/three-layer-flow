function c = plot_line_of_best_fit(x,y)
    X = [ones(length(x),1) x];
    c = X\y;
    scatter(x,y);
    hold on
    plot(x,X*c);
end