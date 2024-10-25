
%in this part we have kept r constant and changed theta.
r = 0.1;
theta = [0, pi/3, pi/2, 5*pi/6, pi]; 
n1 = 100; 
h_n_r = zeros(length(theta), n1); 

for k = 1:length(theta)
    b = [1, -2*cos(theta(k)), 1];
    a = [1, -2*r*cos(theta(k)), r^2];
    h_n_r(k, :) = impz(b, a, n1); 
end
x_axis = 0:n1-1; 
figure;
for k = 1:length(theta)
    subplot(2,2,k)
    stem(x_axis, h_n_r(k, :), 'filled');
    title(['Impulse Response for \theta = ' num2str(theta(k))]);
    xlabel('n');
    ylabel('h[n]');
end

