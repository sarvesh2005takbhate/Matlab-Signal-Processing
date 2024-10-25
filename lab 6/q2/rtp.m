n = 0:9; 
x2_n = (n == 3); 
mu = 5;    
sigma = 2;
N = 10;  
x1_n = sigma * randn(1, N) + mu;

X1_k = fft(x1_n);
X2_k = fft(x2_n);

Y_k = X1_k.*X2_k;

y_n = ifft(Y_k);

figure;
subplot(2,2,1);
stem(n, real(y_n), 'filled');
title('Convolved Signal y[n]');
xlabel('n');
ylabel('y[n]');


