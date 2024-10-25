function [X] = DT_Fourier(x,N0,w)
    X = zeros(1, length(w));  % Initialize the DTFT result vector
    for k = 1 : length(x)
        X = X + x(k)*exp(-1j*w*(k-N0));  % Compute DTFT sum
    end
end

% % Parameters
% w = -10:0.01:10;  % Frequency range
% n = -200:200;     % Time index range
% x = (n == 0);     % Unit impulse signal (delta function)
% N0 = 201;         % Adjusting for the zero index (since n = -200:200)

   

% % Parameters
% w = -10:0.01:10;  % Frequency range
% n = -200:200;     % Time index range
% x = (n == -3);     % Unit impulse signal (delta function)
% N0 = 201;         % Adjusting for the zero index (since n = -200:200)

% % Parameters
% w = -10:0.01:10;  % Frequency range
% n = -200:200;     % Time index range
% x = (n >= -3 & n <= 3);  % Rectangular pulse from -3 to 3
% N0 = 201;         % Adju

% Parameters
w = -10:0.01:10;  % Frequency range
n = -200:200;     % Time index range
w0 = pi/4;        % Fundamental frequency
x = sin(w0*n);    % Signal
N0 = 201;    

% Compute DTFT
X = DT_Fourier(x, N0, w);

% Plotting the results
figure;

% Magnitude plot
subplot(2, 2, 1);
plot(w, abs(X),'r');
title('Magnitude');
xlabel('Frequency (rad/sample)');
ylabel('|X(w)|');

% Phase plot
subplot(2, 2, 2);
plot(w, angle(X),'k');
title('Phase');
xlabel('Frequency (rad/sample)');
ylabel('Phase (radians)');

% Real part plot
subplot(2, 2, 3);
plot(w, real(X),'b');
title('Real Part');
xlabel('Frequency (rad/sample)');
ylabel('Re\{X(w)\}');

% Imaginary part plot
subplot(2, 2, 4);
plot(w, imag(X));
title('Imaginary Part','m');
xlabel('Frequency (rad/sample)');
ylabel('Im\{X(w)\}');
