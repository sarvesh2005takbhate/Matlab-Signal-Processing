
n = 100
a = [1,0.7,0.1];
b = [1];

h = impz(b,a,n)

h = h'

figure;
x_axis = 1:100;
stem(x_axis,h);
grid on;
