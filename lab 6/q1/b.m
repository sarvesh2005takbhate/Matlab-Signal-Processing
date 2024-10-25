n = 0:3;
x_n_1 = ones(1,4);

conv_result = conv(x_n_1,x_n_1);

figure;
subplot(1,1,1);
stem(0:length(conv_result)-1, conv_result, 'filled');
title('Convolution with Unit Pulse Sequence 1 (n = 0 to 3)');
xlabel('n');
ylabel('Amplitude');