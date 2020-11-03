function plot_travelling_wave_spectrum(x, y, H1, H2)

    hold("on");
    plot(log10(abs(fft(y(1:(end-1)/2)))));
    plot(log10(abs(fft(y((end-1)/2+1:end-1)))));
    fprintf("Wavespeed: %e\n", y(end));

end
