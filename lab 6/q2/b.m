n = 0:9; 
x2_n = (n == 3); 
mu = 5;    
sigma = 2;
N = 10;  
x1_n = sigma * randn(1, N) + mu;           

% Linear convolution
linear_conv = conv(x1_n, x2_n);

% Circular convolution
N = length(n);  % N point DFT
circular_conv = cconv(x1_n, x2_n,14);

figure;
%x1_n
subplot(2,2,1);
stem(n, x1_n, 'filled');
title('x1[n] (Random Signal)');
xlabel('n');
ylabel('x1[n]');
grid on;

%x2_n
subplot(2,2,2);
stem(n, x2_n, 'filled');
title('x2[n] (Impulse Function)');
xlabel('n');
ylabel('x2[n]');
grid on;

% convolutions
subplot(2,2,3);
stem(0:length(linear_conv)-1, linear_conv, 'r', 'filled');
title('Linear');
xlabel('n');
ylabel('Amplitude');

subplot(2,2,4);
stem(0:length(circular_conv)-1, circular_conv, 'b', 'filled');
title('Circular Convolution');
xlabel('n');
ylabel('Amplitude');