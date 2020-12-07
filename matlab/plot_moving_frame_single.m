function plot_moving_frame_single(h, t, x, c, tStep)

    [hA, tA, xA] = interpolateData(h, x, t, tStep);

    [xMoving, hMoving] = movingFrame(hA, tA, xA, c);

    pcolor(xMoving', repmat(tA,length(xA),1)', hMoving')
    colorbar("NorthOutside");
    shading('interp');
    xlabel('$x$');
    ylabel('$t$');

    function [hA, tA, xA] = interpolateData( ...
            h, x, t, tStep)

        interpolationMethod = 'spline';

        F1 = griddedInterpolant({x, t}, h, interpolationMethod);
        
        tA = t(1):tStep:t(end);
        xA = linspace(x(1), x(end), 128)';
        
        hA = F1({xA,tA});
    end

    function [xMoving, hMoving] = movingFrame(hA, tA, xA, c)

        xMovingUnsorted = rem(-xA(end) + xA - c * tA, xA(end)) + xA(end) ;
        xMoving = zeros(size(xMovingUnsorted));
        hMoving = zeros(size(hA));

        for n = 1:length(tA)
            [x, I] = sort(xMovingUnsorted(:,n));
            xMoving(:,n) = x;
            hMoving(:,n) = hA(I,n);
        end
    end
end
