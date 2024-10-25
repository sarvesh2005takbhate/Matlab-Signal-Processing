

% load("q2_1.mat")
% x
n = 50
input = ones(1,n);
M = 2;
answer = zeros(1,50*M);

for k=1:n*M
    if mod(k,M) == 0
        answer(k) = input(k/M); %upsampling
    end
end

%now interpolation
for k=M:n*M
    if answer(k) == 0
       answer(k) = answer()



x_axis = 1:50

figure;
stem(x_axis,input,'r')
figure;
stem(x_axis,answer,'b')
grid on;