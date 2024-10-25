
function X = ContinuousFT(t, xt, a, b, w)
    X = zeros(1, length(w));  
    
    for k = 1:length(w)
        temp = xt * exp(-1i * w(k) * t);  
        X(k) = double(int(temp, t, a, b));
    end
end
