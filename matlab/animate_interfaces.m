function frames = animate_interfaces(h, t, x, H1, H2, playBackSpeed, realTime)
    if nargin < 6, playBackSpeed = 1; end
    if nargin < 7, realTime = true; end

    frameRate = 12;
    
    [hA, tA, xA] = interpolateData( ...
            h, x, t, frameRate, playBackSpeed);

    plot_interfaces(xA,hA(:,1),H1,H2);
    title(sprintf("t = %.1f", tA(1)));
    drawnow
    
    ax = gca;
    ax.NextPlot = 'replaceChildren';

    frames(1) = getframe(gcf);
    frames(length(tA)) = struct('cdata',[],'colormap',[]);

    if realTime
        pause(1)
    end
    
    for tI = 2:1:length(tA)
        tic
        plot_interfaces(xA,hA(:,tI),H1,H2);
        title(sprintf("t = %.1f", tA(tI)));
        drawnow
        frames(tI) = getframe(gcf);
        if realTime
            pause(max(0, 1/frameRate - toc))
        end
    end

    function [hA, tA, xA] = interpolateData( ...
            h, x, t, frameRate, playBackSpeed)

        interpolationMethod = 'spline';

        F1 = griddedInterpolant({x, t}, h(1:end/2,:), interpolationMethod);
        F2 = griddedInterpolant({x, t}, h(1+end/2:end,:), interpolationMethod);
        
        tA = t(1):playBackSpeed/frameRate:t(end);
        xA = linspace(x(1), x(end), 128);
        
        hA = [F1({xA,tA}); F2({xA,tA})];
    end
end
