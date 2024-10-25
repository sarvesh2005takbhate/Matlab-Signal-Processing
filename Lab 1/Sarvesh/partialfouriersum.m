% Function to calculate the reconstructed signal
function sum_signal = partialfouriersum(vector, time_limit, T)
    % Initialize the summation
    N = (length(vector)-1)/2;
    sum_signal = zeros(size(time_limit));
    dummy = 1/T;

    for k = -N:N 
        a_k = vector(k+N+1);
        x = a_k * exp((1j)*k*time_limit*2*pi*dummy);
        sum_signal = sum_signal + x;
    end
end