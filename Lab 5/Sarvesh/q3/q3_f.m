n = -200:200;
N = 20;
a = -0.8;
x = a.^n;

x_truncated = x(1:N); 

X_k = fft(x_truncated, N);

figure;
subplot(2,2,1);
stem(0:N-1, x_truncated, 'filled'); 
title(['Input Sequence for N = ', num2str(N)]);
xlabel('n');
ylabel('x[n]');

subplot(2,2,2);
plot(0:N-1, abs(X_k)); 
title(['DFT Magnitude for N = ', num2str(N)]);
xlabel('k');
ylabel('|X[K]|');

subplot(2,2,3);
plot(0:N-1, angle(X_k)); 
title(['Phase of DFT for N = ', num2str(N)]);
xlabel('k');
ylabel('Phase(X[k])');
