function [N, ROC, ROC_zero, S] = region_of_convergence(p)

p_sorted = sort(abs(p)); %this sorts the poles
p_unique = unique(abs(p)); %this stores the unique value of poles
    

N = length(p_unique) + 1;   %unique ROCs
ROC = zeros(N, 2);          %ROC matrix
S = zeros(N, 1);            %stability vector

   
%we have three cases that ROC > max(poles) , ROC btwn two poles and ROC is < min(poles).

%1. ROC i.e |Z| > max(poles)
    ROC(1, :) = [p_sorted(end), Inf];
    if p_sorted(end) > 1
        S(1) = 1;  % Stable if all poles are inside the unit circle
    end

%2. ROC i.e 2 < |Z| < N-1: between poles
    for i = 2:N-1
        ROC(i, :) = [p_sorted(i-1), p_sorted(i)];
        if p_sorted(i-1) < 1 && p_sorted(i) > 1
            S(i) = 1;  % Stable if the unit circle is in the ROC
        end
    end

%3. ROC i.e |Z| < min(poles)
    ROC(N, :) = [0, p_sorted(1)];
    if p_sorted(1) < 1
        S(N) = 1;  % Stable if all poles are outside the unit circle
    end

% To check if 0 is part of any ROC
ROC_zero = any(ROC(:, 1) == 0);

end
