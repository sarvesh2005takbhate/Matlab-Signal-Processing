
syms t;
xt = 2*cos(2*pi*t) + cos(6*pi*t);

T = 1;        % Time period
N = 5;       % Number of harmonics
t1 = -T/2; 
t2 = T/2;     % Integration limits

vector = fourierCoeff(t, xt,T, t1, t2, N);
%now plotting this graph coeffe
x_axis = -N:N;
figure;
stem(x_axis,vector);
grid on;
xlabel('Index');
ylabel('Coeffecient value');


