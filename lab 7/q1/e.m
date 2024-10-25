syms t tau;

function X = ContinuousFT(t, xt, a, b, w)
    X = zeros(1, length(w));  
    for k = 1:length(w)
        temp = xt * exp(-1i * w(k) * t);  
        X(k) = double(int(temp, t, a, b));
    end
end


function yt = convolution(xt)
    syms t tau;
    temp = xt(tau) .* xt(t - tau); 
    yt = int(temp, tau, -inf, inf);
end


w = -20:0.1:20;  
T = 1/2;        


xt = piecewise(-T <= t & t <= T, 1, 0);

yt = convolution(@(tau) piecewise(-T <= tau & tau <= T, 1, 0)); 


Y = ContinuousFT(t, yt, -T, T, w);

figure;

subplot(2,2,1)
plot(w, abs(Y)); 
xlabel('Frequency (w)');
ylabel('|Y(w)|');
title('Magnitude of the FT of Triangular pulse');
grid on;

subplot(2,2,2)
plot(w, real(Y)); 
xlabel('Frequency (w)');
ylabel('Re(Y(w))');
title('Real part of the FT of Triangular pulse');
grid on;

subplot(2,2,3)
plot(w, imag(Y)); 
xlabel('Frequency (w)');
ylabel('Imag(Y(w))');
title('Imaginary part of the FT of Triangular pulse');
grid on;

subplot(2,2,4)
plot(w, angle(Y)); 
xlabel('Frequency (w)');
ylabel('Phase(Y(w))');
title('Phase of the FT of Triangular pulse');
grid on;
