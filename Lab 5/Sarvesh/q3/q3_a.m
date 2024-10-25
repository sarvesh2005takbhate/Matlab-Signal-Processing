n = -200:200;     
L = 4;
N = [4, 16, 64];

figure;
for k = 1:length(N)  
    x = [ones(L,1); zeros(N(k)-L,1)]; 
 
    subplot(3, 2,k);
    stem(0:N(k)-1, x, 'filled'); 
    title(['Input Sequence for N = ', num2str(N(k))]);
    xlabel('n');
    ylabel('x[n]');
end

figure;
for k = 1:length(N)  
    x = [ones(L,1); zeros(N(k)-L,1)]; 

    X_k = fft(x, N(k));  
    
    subplot(3, 2,k);
    plot(abs(X_k(1:N(k)/2)));
    title(['Magnitude of DFT for N = ', num2str(N(k))]);
    xlabel('Frequency (Hz)');
    ylabel('|X[k]|');
end

figure;
for k = 1:length(N)  
    x = [ones(L,1); zeros(N(k)-L,1)]; 

    X_k = fft(x, N(k));   

    subplot(3, 2,k);
    plot(angle(X_k(1:N(k)/2)));  % Plot the phase
    title(['Phase of DFT for N = ', num2str(N(k))]);
    xlabel('Frequency (Hz)');
    ylabel('Phase (radians)');

end