%% Veronica Loomis
% HW02 - Book Problem 11.7 Part iii
% Using the values given
% Plot:
%   R(t) vs. time
%   mFdot(t) vs. time
%   O/F(t) vs. time

L = 50;
Ri = 2;
Ro = 5;
rhoF = 0.0361273; % lb/in**3
a = 0.1;
n = 0.8;
Gox = 1.0; % lb/s-in**2
% since we are told mOxdot is constant, 
% we can define it from the initial G and R values
mOxdot = Gox*pi*Ri^2; 

allTime = linspace(0,100,1000);

i = 1;
testR = Ri;

while testR < 5
    R(i) = (((allTime(i)*a*(2*n+1))*mOxdot^n/(pi^n))+Ri^(2*n+1))^(1/(2*n+1));
    mFdot(i) = 2*a*rhoF*L*mOxdot^n*pi^(1-n)*R(i)^(1-2*n);
    OF(i) = mOxdot/mFdot(i);
    testR = R(i);
    i = i+1;
end

t = allTime(1:i-1);

figure(1)
subplot(3,1,1)
plot(t,R)
title('Radius vs. Time')
grid on
xlabel('Time [sec]')
ylabel('Radius [in]')
subplot(3,1,2)
plot(t,mFdot)
title('Fuel Flow Rate vs. Time')
grid on
xlabel('Time [sec]')
ylabel('Fuel Flow Rate [lb/s]')
subplot(3,1,3)
plot(t,OF)
title('Mixture Ratio vs. Time')
grid on
xlabel('Time [sec]')
ylabel('Mixture Ratio [unitless]')