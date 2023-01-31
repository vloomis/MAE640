%% Problem 11.4-b
% Iteratively solving for w

wGuess = 5;
tol = 1;

while tol > 0.001
    w = 10 + 10*(46.4/(6.81179+wGuess)^2)^0.68;
    tol = abs(wGuess-w);
    wGuess = w;
end

%% Special Problem Plots

mox = 1020.4; % lbm/s
rhof = 0.035; % lb / in**3
a = 0.2;
n = 0.68;
L = 229.15; % in
Rinit = 6.81179; % in 

t = linspace(0,100,1000);

for i=1:1000
    % mixture ratio and oxidizer flux as function of time
    R(i) = (a*(2*n+1)*((mox/(7*pi))^n)*t(i) + Rinit^(2*n+1))^(1/(1+2*n));
    OF(i) = mox / (7*2*pi*a*pi^(1-n)*rhof*L*(mox^n)*R(i)^(1-2*n));
    Gox(i) = mox / (7*pi*R(i)^2);

    % characteristic velocity as function of O/F
    
end


% total fuel mass flow rate and total oxidizer mass flow rate, and total
% propellant flow rate as functions of time

% chamber pressure as a function of time - assuming motor design with the
% calculated oxidizer flow rate and throat area of 300 in **2

% vacuum thrust as function of time assuming cfv=1.7


