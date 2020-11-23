function plot_moving_frame(h, t, x, H1, H2, c, tStep)

    [hA, tA, xA] = interpolateData(h, x, t, tStep);

    [xMoving, hMoving] = movingFrame(hA, tA, xA, c);

    subplot(2,1,1);
    %waterfall(xMoving', repmat(tA,length(xA),1)', hMoving(1+end/2:end,:)')
    pcolor(xMoving', repmat(tA,length(xA),1)', H2 + hMoving(1+end/2:end,:)')
    colorbar();
    shading('interp');
    ylabel('$\eta_2$');
    set(gca,"xtick",[]);

    subplot(2,1,2);
    %waterfall(xMoving', repmat(tA,length(xA),1)', hMoving(1:end/2,:)')
    pcolor(xMoving', repmat(tA,length(xA),1)', H1 + hMoving(1:end/2,:)')
    colorbar();
    shading('interp');
    ylabel('$\eta_1$');
    xlabel('$x$');

    function [hA, tA, xA] = interpolateData( ...
            h, x, t, tStep)

        interpolationMethod = 'spline';

        F1 = griddedInterpolant({x, t}, h(1:end/2,:), interpolationMethod);
        F2 = griddedInterpolant({x, t}, h(1+end/2:end,:), interpolationMethod);
        
        tA = t(1):tStep:t(end);
        xA = linspace(x(1), x(end), 128)';
        
        hA = [F1({xA,tA}); F2({xA,tA})];
    end

    function [xMoving, hMoving] = movingFrame(hA, tA, xA, c)

        xMovingUnsorted = rem(-xA(end) + xA - c * tA, xA(end)) + xA(end) ;
        xMoving = zeros(size(xMovingUnsorted));
        hMoving = zeros(size(hA));

        for n = 1:length(tA)
            [x, I] = sort(xMovingUnsorted(:,n));
            xMoving(:,n) = x;
            hMoving(:,n) = hA([I;end/2+I],n);
        end
    end
end
