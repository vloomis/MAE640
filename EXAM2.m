%% mod 04 steel
clear
clc
% Given
h = 10000; % W/Km**2
k = 60.5;  % W/Km
alpha = 17.7e-6; % m**2/s
TDiff = 2667.2; % K

t = [2,5,10,15];
x = linspace(0,3/39.37,100); % convert in to m

Ti = 298; % K - initial wall temperature
% Equation
% iterate over x, plug in t values that we want for plot purposes
for i=1:100
    for j = 1:4
        T_given1(i,j) = Ti + (TDiff-Ti)*(erfc(x(i)/(2*sqrt(alpha*t(j)))) - exp((h*x(i)/k) + (h^2*alpha*t(j))/(k^2)).*erfc((x(i)/(2*sqrt(alpha*t(j))))+(h*sqrt(alpha*t(j))/k)));
    end
end

figure(1)
plot(x,T_given1)
hold on
% Plot steel melting temperature
plot(x,ones(1,length(x))*1643,'k--')
grid on
legend('t=2','t=5','t=10','t=15')
title('Steel Temperature vs. Distance from Wall')
xlabel('Distance into wall [m]')
hold off

%% mode 04 steel - time
clear
clc
% Given
h = 10000; % W/Km**2
k = 60.5;  % W/Km
alpha = 17.7e-6; % m**2/s
TDiff = 2667.2; % K

t = linspace(0,15,100);
x = 0; % convert in to m

Ti = 298; % K - initial wall temperature
% Equation
% iterate over x, plug in t values that we want for plot purposes
for j=1:100
        T_given2(j) = Ti + (TDiff-Ti)*(erfc(x/(2*sqrt(alpha*t(j)))) - exp((h*x/k) + (h^2*alpha*t(j))/(k^2)).*erfc((x/(2*sqrt(alpha*t(j))))+(h*sqrt(alpha*t(j))/k)));
end

figure(2)
plot(t,T_given2)
hold on
% Plot steel melting temperature
plot(t,ones(1,length(t))*1643,'k--')
grid on
title('Steel Temperature vs. Time')
xlabel('time (s)')
hold off


%% mod 04 copper
clear
clc
% Given
h = 15100; % W/Km**2
k = 380;  % W/Km
alpha = 7.75e-6; % m**2/s
TDiff = 2667.2; % K

t = [2,5,10,15];
x = linspace(0,3/39.37,100); % convert in to m

Ti = 298; % K - initial wall temperature
% Equation
% iterate over x, plug in t values that we want for plot purposes
for i=1:100
    for j = 1:4
        T_given3(i,j) = Ti + (TDiff-Ti)*(erfc(x(i)/(2*sqrt(alpha*t(j)))) - exp((h*x(i)/k) + (h^2*alpha*t(j))/(k^2)).*erfc((x(i)/(2*sqrt(alpha*t(j))))+(h*sqrt(alpha*t(j))/k)));
    end
end

figure(3)
plot(x,T_given3)
hold on
% Plot steel melting temperature
plot(x,ones(1,length(x))*1185,'k--')
grid on
legend('t=2','t=5','t=10','t=15')
title('Copper Temperature vs. Distance from Wall')
xlabel('Distance into wall [m]')
hold off


%% copper time
clear 
clc
% Given
h = 15100; % W/Km**2
k = 380;  % W/Km
alpha = 7.75e-6; % m**2/s
TDiff = 2667.2; % K

t = linspace(0,150,100);
x = 0; % convert in to m

Ti = 298; % K - initial wall temperature
% Equation

for j=1:100
        T_given4(j) = Ti + (TDiff-Ti)*(erfc(x/(2*sqrt(alpha*t(j)))) - exp((h*x/k) + (h^2*alpha*t(j))/(k^2)).*erfc((x/(2*sqrt(alpha*t(j))))+(h*sqrt(alpha*t(j))/k)));
end

figure(4)
plot(t,T_given4)
hold on
% Plot steel melting temperature
plot(t,ones(1,length(t))*1185,'k--')
grid on
title('Copper Temperature vs. Time')
xlabel('time (s)')