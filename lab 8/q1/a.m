t_fine = 0:0.001:2; 
x_t = cos(5*pi*t_fine)+sin(10*pi*t_fine);
Ts = 0.1;
t_samples = 0:Ts:2;
x_n = cos(5*pi*t_samples)+sin(10*pi*t_samples);

figure;
subplot(2,1,1);
plot(t_fine, x_t); 
xlabel('Time'); 
ylabel('Amplitude');
title('Original Signal');
grid on; 

subplot(2,1,2);
stem(t_samples, x_n); 
xlabel('Time'); 
ylabel('Amplitude');
title('Sampled Signal');
grid on; 