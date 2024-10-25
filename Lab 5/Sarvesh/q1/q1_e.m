n = -200:200;   
f_o = 12;       
f_s = 64;         
L = [16,32,64,128];  
m = 8;
% Defining signals
p = cos(2*pi*f_o*n/f_s); 


figure;
for k = 1:length(L)
    w = [ones(1, L(k)), zeros(1, length(n) - L(k))];  
    x = p .* w;
    N = m*L(k); 
    X_k = fft(x, N);  
    freq = (0:N-1) * (f_s / N);  

    subplot(2, 2, k);
    plot(freq(1:N/2), abs(X_k(1:N/2)));
    title(['Magnitude of DFT for N = ', num2str(N)]);
    xlabel('Frequency (Hz)');
    ylabel('|X[k]|');
end
