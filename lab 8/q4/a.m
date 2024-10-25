function xr = sinc_recon(n, xn, Ts, t_fine)

    xr = zeros(1, length(t_fine));
    wc = pi / Ts; 
    for k = n
        xr = xr + Ts * xn(k + 1) * (sin(wc * (t_fine - k * Ts)) ./ (pi * (t_fine - k * Ts)));
    end

    %handling division by zero
    xr(isnan(xr)) = Ts * xn(n(1) + 1); 
end


%t_fine = 0:0.001:2; (given in ques)
t_fine = -10:0.001:10; %just for tp and better visualtion
Ts_values = [0.1, 0.2, 0.3, 0.4]; 
    
figure;
    
for i = 1:length(Ts_values)
        Ts = Ts_values(i);
        
        %t_samples = 0:Ts:2; (given in ques)
         t_samples = -10:Ts:10; %just for tp 
        x_n = cos(5*pi*t_samples);
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

%here as the Ts oncrease we see aliasing
%because 5 hZ is the freq of the given signal 
%so Ts <= 5/2 only in that case we see perfect reconstruction

