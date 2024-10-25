function [X] = DT_Fourier(x,N0,w)

    X = zeros(1, length(w));
    for k = 1 : length(x)
        X = X + x(k)*exp(-1j*w*(k-N0));
    end
end