function temp= partialfouriersum(A,T,time_grid)
w= 2*pi/T;
temp = zeros(size(time_grid)); 
N= length(A)
for k=-N:N
    temp= temp+ A(k+N+1)*exp(1j*k*w*temp);
end
end