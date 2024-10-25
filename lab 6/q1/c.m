n1 = -5:5;
x_n = (-1).^n1;
n2 = -3:1;
h_n = ones(1,5);

conv_result = conv(x_n, h_n);

%conv length
n_conv = (min(n1)+min(n2)):(max(n1)+max(n2));

figure;
subplot(3,1,1);
stem(n1, x_n, 'filled');
title('x[n]');
xlabel('n');
ylabel('x[n]');
grid on;

subplot(3,1,2);
stem(n2, h_n, 'filled');
title('h[n]');
xlabel('n');
ylabel('h[n]');
grid on;

subplot(3,1,3);
stem(n_conv, conv_result, 'filled');
title('Convolution of x[n] and h[n]');
xlabel('n');
ylabel('y[n]');
grid on;
