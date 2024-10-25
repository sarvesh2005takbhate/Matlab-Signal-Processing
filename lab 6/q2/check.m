n = 0:9;  
x2_n = (n == 3);  
mu = 5;    
sigma = 2; 
N = 10; 
x1_n = sigma * randn(1, N) + mu; 

% In genral block diagram
X1_k = fft(x1_n);
X2_k = fft(x2_n);
Y_k = X1_k .* X2_k;
y_fft = ifft(Y_k); 

% Inbuilt function
y_cconv = cconv(x1_n, x2_n, N); 


% Plot the results
figure;

% FFT-based circular convolution (time domain result after inverse FFT)
subplot(2,1,1);
stem(n, real(y_fft), 'filled');
title('FFT-based Circular Convolution y[n]');
xlabel('n');
ylabel('y[n]');

% cconv-based circular convolution
subplot(2,1,2);
stem(n, real(y_cconv), 'filled');
title('Circular Convolution using cconv');
xlabel('n');
ylabel('y[n]');
