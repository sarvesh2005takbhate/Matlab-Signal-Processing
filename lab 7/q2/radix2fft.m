function X = radix2fft(x_n)
    N = length(x_n);
    
    if N < 1 || mod(log2(N), 1) ~= 0
        error('Input length N must be a power of 2.');
    end

    if N == 1
        X = x_n; 
    else 
        even_part = x_n(1:2:N); 
        odd_part = x_n(2:2:N);  

        X_even = radix2fft(even_part);
        X_odd = radix2fft(odd_part);

        W_n = exp(-2 * pi * 1i * (0:N/2-1) / N);
        
        X = [X_even + W_n .* X_odd, X_even - W_n .* X_odd];  
    end
end
