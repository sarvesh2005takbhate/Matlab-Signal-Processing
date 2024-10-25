
output_signal = zeros(1,20);
input_signal1 = [ones(1,10) zeros(1,10)];
input_signal2 = [zeros(1,10) ones(1,10)];
output_signal(1) = 1;


for k= 2:20
    output_signal(k) = (k*input_signal1(k)+(20-k)*input_signal2(k))-((k-1)*input_signal1(k-1)+(20-(k-1))*input_signal2(k-1));
end

x_axis = 1:20 ;
figure;
stem(x_axis,input_signal)
figure;
stem(x_axis,output_signal)
grid on;