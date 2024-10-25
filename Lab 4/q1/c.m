n = 0:100;
w = -10:0.01:10;
a = -0.99;

x1 = a.^n;
x2 = double(n >= 0);
x = x1 .* x2;
N = 5;
X = DT_Fourier(x,N,w);

magnitude = abs(X);
phase = angle(X);

figure;
subplot(2,2,1);
plot(w, magnitude,'r');
xlabel('Frequency');
ylabel('Magnitude');
title('Magnitude Spectrum');

subplot(2,2,2);
plot(w, phase,'k');
xlabel('Frequency');
ylabel('Phase');
title('Phase Spectrum');


subplot(2, 2, 3);
plot(w, real(X),'b');
title('Real Part');
xlabel('Frequency (rad/sample)');
ylabel('Re\{X(w)\}');


subplot(2,2,4);
plot(w, imag(X),'m');
xlabel('Frequency (rad/s)');
ylabel('Magnitude');
title('Imaginary Part');

