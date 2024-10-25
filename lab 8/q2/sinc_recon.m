function xr = sinc_recon(n, xn, Ts, t_fine)

    xr = zeros(1, length(t_fine));
    wc = pi / Ts; 
    for k = n
        xr = xr + Ts * xn(k + 1) * (sin(wc * (t_fine - k * Ts)) ./ (pi * (t_fine - k * Ts)));
    end

    %handling division by zero
    xr(isnan(xr)) = Ts * xn(n(1) + 1); 
end