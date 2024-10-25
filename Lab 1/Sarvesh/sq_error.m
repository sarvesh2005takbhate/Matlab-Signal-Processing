syms t;
T = 1;
T1 = T/4;
t1 = -T1;
t2 = T1;
N = 10;
x_t = piecewise(t1<t<t2,1,t2<abs(t)<T/2,0);

vector = fourierCoeff(t, x_t, t1, t2, N,T);

%now plotting this graph coeffe
x_axis = -N:N;
figure;
stem(x_axis,vector);
grid on;
xlabel('Index');
ylabel('Coeffecient value');