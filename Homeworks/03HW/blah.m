a = 1;
T = linspace(1,6000,10000);

test = @(T) 2*(-57.7979*4184 + (29.182.*T + 14.503.*T.*(T./1000)/2) - (2.0235.*T.*(T./1000).^2)/3 ...
        - (29.182*298 + 14.503*298*(298/1000)/2) - (2.0235*298*(298/1000)^2)/3);