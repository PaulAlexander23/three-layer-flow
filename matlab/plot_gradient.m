function plot_gradient(x,y,m,s)
    if nargin<4
        s = 1;
    end
    
    hold on;
    plot([x,x + s,x+s,x],[y,y + m*s,y,y])
    
end