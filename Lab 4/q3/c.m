n = -100:100;
w = linspace(-pi, pi, 201); 
w1 = pi; 
w2 = pi; 

X = double(w1 <= abs(omega) & abs(omega) <= w2); 

x_reconstructed = INV_DTFT(X,omega, n);

% Plot results
figure;

% Real part
subplot(2,2,1);
plot(n, real(x_reconstructed),'r');
title('Real Part of x[n]');
xlabel('n');
ylabel('Real(x[n])');
grid on;

% Imaginary part
subplot(2,2,2);
plot(n, imag(x_reconstructed));
title('Imaginary Part of x[n]','b');
xlabel('n');
ylabel('Imaginary(x[n])');
grid on;

% Magnitude
subplot(2,2,3);
plot(n, abs(x_reconstructed),'m');
title('Magnitude of x[n]');
xlabel('n');
ylabel('|x[n]|');
grid on;

% Phase
subplot(2,2,4);
plot(n, angle(x_reconstructed),'k');
title('Phase of x[n]');
xlabel('n');
ylabel('Phase(x[n])');
grid on;

figure;

% Plot the frequency domain representation of X
subplot(2,2,1);
plot(omega, real(X),'r');
title('Real Part of X(ω)');
xlabel('ω');
ylabel('Real(X(ω))');
grid on;

subplot(2,2,2);
plot(omega, imag(X),'b');
title('Imaginary Part of X(ω)');
xlabel('ω');
ylabel('Imaginary(X(ω))');
grid on;

subplot(2,2,3);
plot(omega, abs(X),'m');
title('Magnitude of X(ω)');
xlabel('ω');
ylabel('|X(ω)|');
grid on;

subplot(2,2,4);
plot(omega, angle(X),'k');
title('Phase of X(ω)');
xlabel('ω');
ylabel('Phase(X(ω))');
grid on;

