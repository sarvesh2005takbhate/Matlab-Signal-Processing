syms t;
w = -5:0.1:5;  
T = 2;        

xt = piecewise(-T <= t <= T, 1, 0); 

X = ContinuousFT(t, xt, -T, T, w);

figure;

subplot(2,2,1)
plot(w, abs(X)); 
xlabel('Frequency (w)');
ylabel('|X(w)|');
title('Magnitude of the FT of Rectangular pulse');
grid on;

subplot(2,2,2)
plot(w, real(X)); 
xlabel('Frequency (w)');
ylabel('Re(X(w))');
title('Real part of the FT of Rectangular pulse');
grid on;

subplot(2,2,3)
plot(w, imag(X)); 
xlabel('Frequency (w)');
ylabel('Imag(X(w))');
title('Imaginary part of the FT of Rectangular pulse');
grid on;

subplot(2,2,4)
plot(w, angle(X)); 
xlabel('Frequency (w)');
ylabel('phase(X(w))');
title('Phase of the FT of Rectangular pulse');
grid on;
