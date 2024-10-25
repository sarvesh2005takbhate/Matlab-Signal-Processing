function ma_sys = moving_avg_sys(input_signal, N, n)
    sum_val = 0;
    for k = n-N+1:n
        if k > 0 && k <= length(input_signal) 
            sum_val = sum_val + input_signal(k);
        end
    end
    ma_sys = sum_val / N; % Calculate the average
end
