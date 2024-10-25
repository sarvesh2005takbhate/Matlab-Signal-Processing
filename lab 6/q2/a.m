n = 0:9; 
x1_n = randn(1, 10);
x2_n = (n == 3);  %impulse fucntion

figure;
subplot(2,1,1);
stem(n, x1_n);
title('Sequence x1[n] (Random Gaussian Sequence)');
xlabel('n');
ylabel('x1[n]');

subplot(2,1,2);
stem(n, x2_n);
title('Sequence x2[n] (First 10 Samples of \delta[n - 3])');
xlabel('n');
ylabel('x2[n]');

