% Function to compute Continuous Fourier Transform
function X = ContinuousFT(t, xt, a, b, w)
    X = zeros(1, length(w));  % Preallocate for speed
    
    for k = 1:length(w)
        temp = xt * exp(-1i * w(k) * t);  % Multiply by complex exponential
        X(k) = double(int(temp, t, a, b));  % Integrate over the limits
    end
end

% Function to compute the convolution of two signals
function yt = convulution(xt1, xt2)
    yt = conv(xt1, xt2, 'same');  % Use 'same' to keep the size of output
end

% Main Script
syms t;
w = -5:0.1:5;  % Frequency range
T = 1/2;       % Duration of rectangular pulse

% Define rectangular pulse
xt = piecewise(-T <= t & t <= T, 1, 0);

% Discretize time for convolution
t_vals = -1:0.01:1;  % Time range for discrete time signals
xt_discrete = double(subs(xt, t, t_vals));  % Get discrete version of xt

% Convolve the rectangular pulse with itself
yt_discrete = convulution(xt_discrete, xt_discrete);  % This will give a triangular pulse

% Fourier Transform of the triangular pulse
Y = ContinuousFT(t, yt_discrete, -T, T, w);

% Plot the results
figure;

subplot(2,2,1)
plot(w, abs(Y)); 
xlabel('Frequency (w)');
ylabel('|Y(w)|');
title('Magnitude of the FT of Triangular Pulse');
grid on;

subplot(2,2,2)
plot(w, real(Y)); 
xlabel('Frequency (w)');
ylabel('Re(Y(w))');
title('Real Part of the FT of Triangular Pulse');
grid on;

subplot(2,2,3)
plot(w, imag(Y)); 
xlabel('Frequency (w)');
ylabel('Imag(Y(w))');
title('Imaginary Part of the FT of Triangular Pulse');
grid on;

subplot(2,2,4)
plot(w, angle(Y)); 
xlabel('Frequency (w)');
ylabel('Phase(Y(w))');
title('Phase of the FT of Triangular Pulse');
grid on;
