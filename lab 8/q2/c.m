% Sinc Reconstruction (Frequency domain Rect function in time domain)
function xr = sinc_recon(n, xn, Ts, t_fine)

    xr = zeros(1, length(t_fine));
    wc = pi / Ts; 
    for k = n
        xr = xr + Ts * xn(k + 1) * (sin(wc * (t_fine - k * Ts)) ./ (pi * (t_fine - k * Ts)));
    end
    %handling division by zero
    % xr(isnan(xr)) = Ts * xn(n(1) + 1); 
end

t_fine = 0:0.001:2;
x_t = cos(5*pi*t_fine) + sin(10*pi*t_fine); 

Ts = 0.1; 
t_samples = 0:Ts:2; 
x_n = cos(5*pi*t_samples) + sin(10*pi*t_samples); 

% Zero-order hold interpolation (part a)
x_zoh = interp1(t_samples, x_n, t_fine, 'previous');

% Linear interpolation (part b)
x_loh = interp1(t_samples, x_n, t_fine, 'linear');

n = 0:length(x_n)-1;
x_r = sinc_recon(n, x_n, Ts, t_fine);

figure;
subplot(2,2,1);
stem(t_samples, x_n); 
xlabel('Time'); 
ylabel('Amplitude');
title('Sampled Signal');
grid on; 


subplot(2,2,2);
plot(t_fine, x_zoh); 
xlabel('Time'); 
ylabel('Amplitude');
title('Zero-Order Hold Interpolation');
grid on; 

subplot(2,2,3);
plot(t_fine, x_loh); 
xlabel('Time'); 
ylabel('Amplitude');
title('Linear Interpolation');
grid on;

subplot(2,2,4);
plot(t_fine, x_r);
xlabel('Time');
ylabel('Amplitude');
title('Reconstructed Signal');
grid on;

