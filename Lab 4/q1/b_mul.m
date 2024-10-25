n = -200:200;  

signals = cell(1, 4);


for i = 1:4
    switch i
        case 1
            % 1. Unit impulse δ[n]
            signals{i} = (n == 0);  % δ[n] = 1 when n == 0, 0 otherwise
            
        case 2
            % 2. Shifted unit impulse δ[n + 3]
            signals{i} = (n == -3);  % δ[n + 3] = 1 when n == -3, 0 otherwise
            
        case 3
            % 3. Rectangular pulse from -3 to 3
            signals{i} = (n >= -3 & n <= 3);  % Rectangular pulse from n = -3 to 3
            
        case 4
            % 4. Finite duration sinusoid sin(ω0n) with ω0 = π/4 for n = -200 to 200
            w0 = pi/4;
            signals{i} = sin(w0 * n);  % Sinusoid with ω0 = π/4
    end
end

% Plot the signals
figure;
for i = 1:4
    subplot(4, 1, i);
    stem(n, signals{i}, 'filled');
    switch i
        case 1
            title('Unit Impulse \delta[n]');
        case 2
            title('Shifted Unit Impulse \delta[n + 3]');
        case 3
            title('Rectangular Pulse from -3 to 3');
        case 4
            title('Finite Duration Sinusoid sin(\omega_0 n) with \omega_0 = \pi/4');
    end
    xlabel('n');
    ylabel('Amplitude');
end
