n = -200:200;   
f_o = 12;       
f_s = 64;       
L = 16;         
m = [1, 2, 4, 8];  

% Defining signals
p = cos(2*pi*f_o*n/f_s); 
w = [hann(L)', zeros(1, length(n) - L)];  

x = p .* w;

figure;
for k = 1:length(m)
    N = m(k) * L;  % Length of DFT
    X_k = fft(x, N);  % Compute DFT
    freq = (0:N-1) * (f_s / N);  

    subplot(2, 2, k);
    
    if m(k) == 1 || m(k) == 2
        % Use stem for small m values
        stem(freq(1:N/2), abs(X_k(1:N/2)), 'filled');
    else
        % Use plot for larger m values
        plot(freq(1:N/2), abs(X_k(1:N/2)));
    end

    title(['Magnitude of DFT for N = ', num2str(N)]);
    xlabel('Frequency (Hz)');
    ylabel('|X[k]|');
end
