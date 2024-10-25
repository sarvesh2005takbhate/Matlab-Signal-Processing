syms t;
t1 = 0.1;
T = 1;
N = 10;
xt = piecewise(-t1<t<t1,1,t1<t<T-t1,0);

vector = fourierCoeff(t,xt,T,-t1,t1,N);

%now plotting this graph coefficients
x_axis = -N:N;
figure; 
stem(x_axis,vector);
grid on;
xlabel('Index');
ylabel('Coeffecient value');

%now finding the 
time_limit =    -0.5:0.01:0.5;
reconstruction = partialfouriersum(vector,time_limit,T);

plot(time_limit,real(reconstruction),'r');
xlabel('Time');
ylabel('Amplitude');
title('Reconstructed Signal');