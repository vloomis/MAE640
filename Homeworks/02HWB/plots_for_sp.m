%% Problem 11.4-b
% Iteratively solving for w

wGuess = 5;
tol = 1;

while tol > 0.001
    w = 10 + 10*(46.4/(6.81179+wGuess)^2)^0.68;
    tol = abs(wGuess-w);
    wGuess = w;
end

fprintf('The web distance is %0.3f inches\n\n', wGuess)

%% Special Problem Plots

mox = 1020.4; % lbm/s
rhof = 0.035; % lb / in**3
a = 0.2;
n = 0.68;
L = 229.15; % in
Rinit = 6.81179; % in 
cfv = 1.7;

t = linspace(0,100,1000);

% calculated in Excel
cStarConst = 5903.984; % ft/s
At = 300/144;     % ft**2

for i=1:1000
    R(i) = (a*(2*n+1)*((mox/(7*pi))^n)*t(i) + Rinit^(2*n+1))^(1/(1+2*n));
    Gox(i) = mox / (7*pi*R(i)^2);
    mf(i) = a*((Gox(i))^n)*rhof*7*2*pi*R(i)*L;
    OF(i) = mox / mf(i);

    cStar(i) = 359.8*(OF(i))^3 - 2848.3*(OF(i))^2 + 7136.2*(OF(i)) + 148.72;
    Pc(i) = cStarConst*(mox+mf(i))/(At*32.2);

    tVac(i) = cfv*Pc(i)*At;
end

% Plots
figure(1)
plot(t,OF)
title('Mixture Ratio and Oxidizer Flux vs Time')
xlabel('Time [seconds]')
ylabel('Ratio / Flux')
hold on
grid on
plot(t,Gox)
legend('Mixture Ratio','Oxidizer Flux')

figure(2)
plot(OF, cStar)
grid on
title('Characteristic Velocity vs Mixture Ratio')
xlabel('Mixture Ratio')
ylabel('Characteristic Velocity [ft/s]')

figure(3)
plot(t, mf)
grid on
title('Total Fuel Mass Flow Rate vs Time')
xlabel('Time [seconds]')
ylabel('Flow Rate [lbm/s]')

figure(4)
plot(t, Pc)
grid on
title('Chamber Pressure vs Time')
xlabel('Time [seconds]')
ylabel('Chamber Pressure [lbf/ft**2]')

figure(5)
plot(t, tVac)
grid on
title('Vacuum Thrust vs Time')
xlabel('Time [seconds]')
ylabel('Thrust [lbf]')