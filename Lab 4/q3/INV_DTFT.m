function x = INV_DTFT(X,w,n)
    x = zeros(1, length(n)); 
    a = 1 / (2 * pi); 
    for k = 1:length(n)
        p = X .* exp(1j * w * n(k));
        x(k) = a * trapz(w,p); 
    end
end


