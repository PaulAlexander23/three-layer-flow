function plot_wavelength_vs_time(x, t, h)

    [meanL, sdL] = averageWavelength(x, h);

    hold("on");
    plot(t, meanL);
    plot(t, sdL);
    %plot(t, meanL + sdL, "--");

    function [meanL, sdL] = averageWavelength(x, h)
        N = size(h, 2);

        meanL = zeros(N, 1);
        sdL = zeros(N, 1);

        for n = 1:N
            wavelengths = computeWavelengths(x, h(:, n));

            meanL(n) = mean(wavelengths.^2);
            sdL(n) = std(wavelengths);
        end
    end

    function wavelengths = computeWavelengths(x, h)
        positive = h > 0;
        cross = positive([2:end,1]) .* (1-positive);
        indices = find(cross);
        N = length(indices);
        xZeros = zeros(N, 1);
        for n = 1:N
            x1 = x(indices(n));
            h1 = h(indices(n));
            if indices(n)+1 > length(x)
                x2 = x(1);
                h2 = h(1);
            else
                x2 = x(indices(n)+1);
                h2 = h(indices(n)+1);
            end
            xZeros(n) = x1 - h1 * (x2 - x1)/(h2 - h1);
        end
        wavelengths = [xZeros(2:end); x(end) + xZeros(1)] - xZeros;
    end
end
