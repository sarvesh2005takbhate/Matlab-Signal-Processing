
x_n = [1,2,3,4];  
X = radix2fft(x_n); 
disp(X)

X_normal = fft(x_n);
disp(X_normal)
