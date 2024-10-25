
t_fine = 0:0.001:2;
x_t = cos(5*pi*t_fine) + sin(10*pi*t_fine); 

Ts = 0.1; 
t_samples = 0:Ts:2; 
x_n = cos(5*pi*t_samples) + sin(10*pi*t_samples); 

% Zero-order hold interpolation
x_zoh = interp1(t_samples, x_n, t_fine, 'previous');

% Linear interpolation
x_loh = interp1(t_samples, x_n, t_fine, 'linear');

% Sinc reconstruction
n = 0:length(x_n)-1;
x_r = sinc_recon(n, x_n, Ts, t_fine);


start_idx = find(t_fine >= 0.25, 1); 
end_idx = find(t_fine <= 1.75, 1, 'last');

% Compute the maximum absolute error in the interval [0.25, 1.75]
mae1 = max(abs(x_t(start_idx:end_idx) - x_zoh(start_idx:end_idx)));
mae2 = max(abs(x_t(start_idx:end_idx) - x_loh(start_idx:end_idx)));
mae3 = max(abs(x_t(start_idx:end_idx) - x_r(start_idx:end_idx)));

% Display the MAE
fprintf('MAE for ZERO-HOLD interpolation %.6f\n', mae1);
fprintf('MAE for LINEAR interpolation %.6f\n', mae2);
fprintf('MAE for SINC-RECON interpolation %.6f\n', mae3);

figure;

subplot(2, 2, 1);
stem(t_samples, x_n, 'r', 'LineWidth', 1.5); 
hold on;
plot(t_fine, x_t, 'b-', 'LineWidth', 1.5); 
legend('Sampled Points', 'Original Signal');
xlabel('Time');
ylabel('Amplitude');
title('Original Sampled Points');
grid on;


subplot(2, 2, 2);
stem(t_samples, x_n, 'r', 'LineWidth', 1.5); 
hold on;
plot(t_fine, x_zoh, 'g--', 'LineWidth', 1.5); 
legend('Sampled Points', 'Zero-Order Hold Reconstruction');
xlabel('Time');
ylabel('Amplitude');
title('Zero-Order Hold Interpolation');
grid on;


subplot(2, 2, 3);
stem(t_samples, x_n, 'r', 'LineWidth', 1.5); 
hold on;
plot(t_fine, x_loh, 'g--', 'LineWidth', 1.5); 
legend('Sampled Points', 'Linear Interpolation');
xlabel('Time');
ylabel('Amplitude');
title('Linear Interpolation');
grid on;


subplot(2, 2, 4);
stem(t_samples, x_n, 'r', 'LineWidth', 1.5); 
hold on;
plot(t_fine, x_r, 'g--', 'LineWidth', 1.5); 
legend('Sampled Points', 'Sinc Reconstruction');
xlabel('Time');
ylabel('Amplitude');
title('Sinc Reconstruction');
grid on;
