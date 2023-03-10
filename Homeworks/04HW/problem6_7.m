%% Problem 6.7 in textbook

% Given
h = 10000; % W/Km**2
k = 60.5;  % W/Km
alpha = 17.7e-6; % m**2/s
Pc = 300; % psi (2.068e6 N/m**2)
% oxidizer = 85% aqueous H2O2
% fuel = HTPB
OF = 7;

t = [2,5,10,15];
xDist = (2.5625- 0.535)/39.37; % convert in to m
x = linspace(0,xDist,100); % range of x values we are interested in

Ti = 298; % K - initial wall temperature
TinfGiven = 2667.2; % K - hot gas temperature
TinfCEQ = 1816.675; % K - hot gas temperature 
                    % found from CEQUEL and converting to throat temp

% Equation
% iterate over x, plug in t values that we want for plot purposes
for i=1:100
    for j = 1:4
        T_given(i,j) = Ti + (TinfGiven - Ti)*(erfc(x(i)/(2*sqrt(alpha*t(j)))) - exp((h*x(i)/k) + (h^2*alpha*t(j))/(k^2)).*erfc((x(i)/(2*sqrt(alpha*t(j))))+(h*sqrt(alpha*t(j))/k)));
        T_CEQ(i,j) = Ti + (TinfCEQ - Ti)*(erfc(x(i)/(2*sqrt(alpha*t(j)))) - exp((h*x(i)/k) + (h^2*alpha*t(j))/(k^2)).*erfc((x(i)/(2*sqrt(alpha*t(j))))+(h*sqrt(alpha*t(j))/k)));
    end
end

figure(1)
plot(x,T_given)
hold on
% Plot steel melting temperature
plot(x,ones(1,length(x))*1643.15,'k--')
grid on
legend('t=2','t=5','t=10','t=15')
title({'Temperature vs. Distance from Wall','Using Temp given in solution'})
xlabel('Distance into wall [m]')

figure(2)
plot(x,T_CEQ)
hold on
% Plot steel melting temperature
plot(x,ones(1,length(x))*1643.15,'k--')
grid on
legend('t=2','t=5','t=10','t=15')
title({'Temperature vs. Distance from Wall','Using CEQUEL'})
xlabel('Distance into wall [m]')