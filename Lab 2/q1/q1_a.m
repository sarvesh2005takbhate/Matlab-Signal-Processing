
load ("q1.mat")
x
x = x'
n = 101;
% mavs = [zeros(1,50) ones(1,50)];
N = 20; % window size for calculating avg

answer = zeros(1,n); % 

for k = 1:n
    answer(k) = moving_avg_sys(x, N, k); %hardcoding for each and every n
end

x_axis = 1:n; 

figure;
stem(x_axis, answer); 
grid on;

