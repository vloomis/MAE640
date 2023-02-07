Ru = 8.314;
Tc = 5163.9956;
gamma = 1.194;
molarMass = 36.04;

cStar = sqrt(1000*Ru*Tc/(gamma*molarMass)) * (2/(gamma+1))^(-(gamma+1)/(2*(gamma-1)));


%% SP-A e)
% Plot Specific Heat of water as a function of temperature

T = linspace(0,7500,1000);
cP = 29.182 + 14.503*(T/1000) - 2.0235*(T/1000).^2;

figure(1)
plot(T,cP)
grid on

%% SP-A f)
% Plot total enthalpy as a function of temperature

T = linspace(0,7500,1000);
enthalpy = 2*(-57.7979*4184 + 29.182*T + (14.503/2)*T.*(T/1000) - (2.0235/3)*T.*(T/1000).^2 - (29.182*298 + (14.503/2)*298*(298/1000) - (2.0235/3)*298*(298/1000).^2));

figure(2)
plot(T, enthalpy)
grid on