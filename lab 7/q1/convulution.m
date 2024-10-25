function yt = convulution(xt)
    syms t tau;
    temp = xt(tau) .* xt(t - tau); 
    yt = int(temp, tau, -inf, inf);
end

