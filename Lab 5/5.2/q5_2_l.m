% Perform linear and circular convolutions of 𝑥1[𝑛] and 𝑥2[𝑛] using the DFT method. You
% must perform these convolutions using DFT and inverse DFT of the appropriate signals.
% Use the matlab commands fft and ifft to compute the DFT and inverse DFT of the
% signals. Make sure each result is of the expected length.

% part-l
x1 = randn(1,10); % gaussian noise
x2 = [zeros(1,3) 1 zeros(1, 6)]; % first 10 samples of the signal 𝛿[𝑛 − 3] starting from n = 0
% perform linear convolution using DFT
N = 10;
X1 = fft(x1,N);
X2 = fft(x2,N);
circular_dft = ifft(X1.*X2,N);

% perform circular convolution using DFT
linear_dft = ifft(fft(x1,10).*fft(x2,10),10);

% plot the circular and linear convolution using DFT
figure;
subplot(2,2,1);
stem(x1);
xlabel("n");
ylabel("x_1[n]");
title("Random Gaussian Sequence");
grid on;

subplot(2,2,2);
stem(x2);
xlabel("n");
ylabel("x_2[n]");
title("\delta[n-3]");
grid on;

subplot(2,2,3);
stem(circular_dft);
xlabel("n");
ylabel("circular convolution ");
title("Circular Convolution of x_1[n] and x_2[n]");
grid on;

subplot(2,2,4);
stem(linear_dft);
xlabel("n");
ylabel("linear convolution");
title("Linear Convolution of x_1[n] and x_2[n]");
grid on;