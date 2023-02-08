%% SP-A e)
% Characteristic velocity

Ru = 8.314;
Tc = 5163.9956;
gamma = 1.194;
molarMass = 36.04;

cStar = sqrt(1000*Ru*Tc/(gamma*molarMass)) * (2/(gamma+1))^(-(gamma+1)/(2*(gamma-1)));


%% SP-A f)
% Plot Specific Heat of water as a function of temperature

T = linspace(0,7500,1000);
cP = 29.182 + 14.503*(T/1000) - 2.0235*(T/1000).^2;

figure(1)
plot(T,cP)
grid on
title({'SP-A f)','Specific heat of H_2O'})
xlabel('Temp [K]')
ylabel('Specific Heat (C_P)')

%% SP-A g)
% Plot total enthalpy as a function of temperature

T = linspace(0,7500,1000);
enthalpyA = 2*(-57.7979*4184 + 29.182*T + (14.503/2)*T.*(T/1000) - (2.0235/3)*T.*(T/1000).^2 - (29.182*298 + (14.503/2)*298*(298/1000) - (2.0235/3)*298*(298/1000).^2));

figure(2)
plot(T, enthalpyA)
grid on
title({'SP-A g)','Total Enthalpy vs Temperature'})
xlabel('Temp [K]')
ylabel('Total Enthalpy [J/mole]')

%% SP-B a)
% guess T
% use that to get Kp
% use that to find a
% plug in to equation and see how it looks

Ts = [3000, 3250, 3500, 3750, 4000];
kp = [0.21, 9.5786, 4.9295, 2.7498, 16.623];
a =  [0.20914, 1.51728, 1.309, 1.0852, 1.65];


for i=1:length(Ts)
    enthalpyB(i) = a(i)*((-57800*4.184) + (29.182*Ts(i) + (14.503/2)*Ts(i)*(Ts(i)/1000) - (2.0235/3)*Ts(i)*(Ts(i)/1000)^2) - ((29.182*298 + (14.503/2)*298*(298/1000) - (2.0235/3)*298*(298/1000)^2 )))...
        + (2 - a(i))*(26.896*Ts(i) + (4.35011/2)*Ts(i)*(Ts(i)/1000) - (0.32674/3)*Ts(i)*(Ts(i)/1000)^2) - (26.896*298 + (4.35011/2)*298*(298/1000) - (0.32674/3)*298*(298/1000)^2)...
        + ((2-a(i))/2)*(28.186*Ts(i) + (6.3011/2)*Ts(i)*(Ts(i)/1000) - (0.74986/3)*Ts(i)*(Ts(i)/1000)^2) - (28.186*298 + (6.3011/2)*298*(298/1000) - (0.74986/3)*298*(298/1000)^2);
end

plot(Ts,enthalpyB,'r*')
grid on

%% SP-B b)
B = -1.8559E-10;
C = 2.3375E-06;
D = -1.0500E-02;
E = 1.6715E+01;

T = 3500;

kp = B*T^3 + C*T^2 + D*T + E;

%% SP-B d)

cph2o = 29.182 + 14.503*(3500/1000) - 2.0235*(3500/1000)^2;
cph2 = 26.896 + 4.350*(3500/1000) - 0.32674*(3500/1000)^2;
cpo2 = 28.186 + 6.3011*(3500/1000) - 0.74986*(3500/1000)^2;

cp = cph2o + cph2 + cpo2;

%% SP-B e)
Ru = 8.314;
Tc = 3500;
gamma = 1.066;
molarMass = 36.04;

cStar = sqrt(1000*Ru*Tc/(gamma*molarMass)) * (2/(gamma+1))^(-(gamma+1)/(2*(gamma-1)));


%% SP-B f)
% Plot Specific Heat of water as a function of temperature

T = linspace(0,7500,1000);
cph2o = 29.182 + 14.503*(T/1000) - 2.0235*(T/1000).^2;
cph2 = 26.896 + 4.350*(T/1000) - 0.32674*(T/1000).^2;
cpo2 = 28.186 + 6.3011*(T/1000) - 0.74986*(T/1000).^2;

figure(3)
subplot(3,1,1)
plot(T,cph2o)
grid on
title('Specific heat of H_2O')
xlabel('Temp [K]')
ylabel('Specific Heat (C_P)')
subplot(3,1,2)
plot(T,cph2)
grid on
title('Specific heat of H_2')
xlabel('Temp [K]')
ylabel('Specific Heat (C_P)')
subplot(3,1,3)
plot(T,cpo2)
grid on
title('Specific heat of O_2')
xlabel('Temp [K]')
ylabel('Specific Heat (C_P)')

%% SP-A g)
% Plot total enthalpy as a function of temperature

Ts = linspace(0,7500,1000);
a = 1.266;
enthalpy = a*((-57800*4.184) + (29.182*Ts + (14.503/2)*Ts.*(Ts/1000) - (2.0235/3)*Ts.*(Ts/1000).^2) - ((29.182*298 + (14.503/2)*298*(298/1000) - (2.0235/3)*298*(298/1000)^2 )))...
        + (2 - a)*(26.896*Ts + (4.35011/2)*Ts.*(Ts/1000) - (0.32674/3)*Ts.*(Ts/1000).^2) - (26.896*298 + (4.35011/2)*298*(298/1000) - (0.32674/3)*298*(298/1000)^2)...
        + ((2-a)/2)*(28.186*Ts + (6.3011/2)*Ts.*(Ts/1000) - (0.74986/3)*Ts.*(Ts/1000).^2) - (28.186*298 + (6.3011/2)*298*(298/1000) - (0.74986/3)*298*(298/1000)^2);
plot(T, enthalpy)
grid on
title({'SP-B g)','Total Enthalpy vs Temperature'})
xlabel('Temp [K]')
ylabel('Total Enthalpy [J/mole]')