function xr = sinc_recon(n, xn, Ts, t_fine)

    xr = zeros(1, length(t_fine));
    wc = pi / Ts; 
    for k = n
        xr = xr + Ts * xn(k + 1) * (sin(wc * (t_fine - k * Ts)) ./ (pi * (t_fine - k * Ts)));
    end

    %handling division by zero
    xr(isnan(xr)) = Ts * xn(n(1) + 1); 
end


t_fine = -10:0.001:10;
Ts_values = [0.5, 0.2, 0.1, 0.05];
    
figure;
    
for i = 1:length(Ts_values)
        Ts = Ts_values(i);
        
        t_samples = -1:Ts:1;
        x_n = max(0, 1 - abs(t_samples));
        n = 0:length(t_samples)-1;
        
        xr = sinc_recon(n, x_n, Ts, t_fine);
        
        subplot(2, 2, i);
        plot(t_samples, x_n, 'o', 'DisplayName', 'Samples');
        hold on;
        plot(t_fine, xr, 'DisplayName', 'Reconstructed Signal');
        title(['Sampling Interval Ts = ', num2str(Ts)]);
        xlabel('Time (s)');
        ylabel('Amplitude');
        legend show;
        grid on;
end

%as the sampling frequency changes we can oberve perfect reconstruction
%but tere is a phase shift in the signal 