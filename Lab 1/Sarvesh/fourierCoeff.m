function store_coeff = fourierCoeff(t, x_t, t1, t2, N,T)

    % Declaring a vector array of all zeros
    % As we will have 2*N+1 coefficients (-N to N and one 0)
    % so the size of the vector should be that 
    store_coeff = zeros(1, 2*N + 1);

    % Calculate the coefficients for each of the 2*N+1 terms
    %we use a for loop which goes from the -N to N 
    x = 1/T;      

    for k = -N:N
        % Define the integranl
        integral_find = x_t * exp(-2*pi*k*(1j)*t*x);

        % Calculate the coefficient using symbolic integration
        coeff = x * int(integral_find, t, t1, t2);
        % Store the coefficient in the vector
        store_coeff(k + N + 1) = coeff;
    end
end
