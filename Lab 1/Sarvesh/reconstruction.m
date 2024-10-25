% Main script
syms t;
x_t = 2*cos(2*pi*t) + cos(6*pi*t);
T = 1;        % Time period
N = 5;       % Number of harmonics
t1 = -T/2; 
t2 = T/2;     % Integration limits
time_limit = -0.5 : 0.01 : 0.5;

% Calculate Fourier coefficients
vector = fourierCoeff(t, x_t, t1, t2, N, T);

% Reconstruct the signal using the Fourier series
reconstructed_signal = partialfouriersum(vector, time_limit, T);


%now calculating the error
% maximum_absolute_error = abs(reconstructed_signal-x_t);
% find_error = max(maximum_absolute_error);
% find_error


% Plot the reconstructed signal
% plot(vector);
% figure;
plot(time_limit, real(reconstructed_signal),'g');
hold on;
x_t = 2*cos(2*pi*time_limit) + cos(6*pi*time_limit);
plot(time_limit, x_t,'--r');
xlabel('Time');
ylabel('Amplitude');
title('Reconstructed Signal');
hold off;


