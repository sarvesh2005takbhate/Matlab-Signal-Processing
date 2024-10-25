x1 = randn(1,10); % gaussian noise
x2 = [zeros(1,3) 1 zeros(1, 6)]; % first 10 samples of the signal 𝛿[𝑛 − 3] starting from n = 0

% part-k
% Compute the convolution of the two sequences using the conv function in MATLAB.
linear = conv(x1,x2,"full");
circular = cconv(x1,x2,10);

% plot the circular and linear convolution
figure;
% plot x1 and x2
subplot(1,2,1);
stem(circular);
xlabel("n");
ylabel("circular convolution ");
title("Circular Convolution of x_1[n] and x_2[n]");
grid on;

subplot(1,2,2);
stem(linear);
xlabel("n");
ylabel("linear convolution");
title("Linear Convolution of x_1[n] and x_2[n]");
grid on;