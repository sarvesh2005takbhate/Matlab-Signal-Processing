n = 0:20;
f = 1/3;
x1_n = sin(2*pi*f*n);
n1 = -18:14;
x2_n = (-1).^n1;

conv_result = conv(x2_n,x1_n);

%conv length
n_conv = (min(n1)+min(n)):(max(n1)+max(n));

figure;
subplot(3,1,1);
stem(n, x1_n, 'filled');
title('x1[n]');
xlabel('n');
ylabel('x1[n]');
grid on;

subplot(3,1,2);
stem(n1,x2_n, 'filled');
title('x2[n]');
xlabel('n');
ylabel('x2[n]');
grid on;

subplot(3,1,3);
stem(n_conv, conv_result, 'filled');
title('Convolution of x1[n] and x2[n]');
xlabel('n');
ylabel('y[n]');
grid on;

