n = 0:9;
f = 10;

h_n = rand(1,10);
x_n_1 = ones(1, 10); 
x_n_2 = [zeros(1, 4), ones(1, 6)];  

conv_1 = conv(x_n_1, h_n);
conv_2 = conv(x_n_2, h_n);

figure;
subplot(2,2,1);
stem(n,h_n,'filled');
title('random signal');
xlabel('n');
ylabel('Amplitude');

subplot(2,2,2);
stem(n,x_n_1,'filled');
title('random signal');
xlabel('n');
ylabel('Amplitude');

subplot(2,2,3);
stem(n,x_n_2,'filled');
title('random signal');
xlabel('n');
ylabel('Amplitude');

subplot(2,2,4);
stem(0:length(conv_1)-1, conv_1, 'filled');
title('Convolution with Unit Pulse Sequence 1 (n = 0 to 9)');
xlabel('n');
ylabel('Amplitude');

subplot(2,2,5);
stem(0:length(conv_2)-1, conv_2, 'filled');
title('Convolution with Unit Pulse Sequence 2 (n = -4 to 5)');
xlabel('n');
ylabel('Amplitude');
sgtitle('Convolution Results');
