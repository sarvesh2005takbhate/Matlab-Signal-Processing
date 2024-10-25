function F= fourierCoeff(t,xt,T,t1,t2,N)
F= zeros(2*N+1,1);
w= 2*pi/T;
for k= -N:N
    expr= xt* exp(-1j*k*w*t);
    temp = int(expr,t,[t1,t2]);
    F(k+N+1)= temp;
end