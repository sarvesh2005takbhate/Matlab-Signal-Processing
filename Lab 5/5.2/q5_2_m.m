% part-j
x1 = randn(1,10); % gaussian noise
x2 = [zeros(1,3) 1 zeros(1, 6)]; % first 10 samples of the signal 𝛿[𝑛 − 3] starting from n = 0

% part-k
% Compute the convolution of the two sequences using the conv function in MATLAB.
linear = conv(x1,x2,"full");
circular = cconv(x1,x2,10);

% part-l
X1 = fft(x1,N);
X2 = fft(x2,N);
circular_dft = ifft(X1.*X2,N);
linear_dft = ifft(fft(x1,10).*fft(x2,10),10);
% Verification of DTFT based and direct result
%  Plot the four outputs in a single 2x2 figure and verify that the two methods (direct and
% DFT based) give same answer for linear convolution. Similarly for circular convolution.

subplot(2,2,1);
stem(circular);
xlabel("n");
ylabel("circular convolution ");
title("Circular Convolution of x_1[n] and x_2[n]");
grid on;

subplot(2,2,2);
stem(linear);
xlabel("n");
ylabel("linear convolution");
title("Linear Convolution of x_1[n] and x_2[n]");
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