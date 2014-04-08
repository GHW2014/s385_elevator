clear all
clc

syms s



% Initialization of the motor's transfer function.
M1 = 150;
M2 = 200;
m = 140;
K = 20000;
c = 1;

num = sym2poly(c*s + K);

den = sym2poly(s*(M1*(M2+m)*s^2 + (c*s+K)*(M1+M2+m)));
G = tf(num, den);

H = 1;

%%
Kp = 1;
Kd = 1;
Ki = 11;

C1 = pid(Kp, Ki, Kd);

Kp2 = 1;
Kd2 = 22;
Ki2 = 0;

C2 = pid(Kp2, Ki2, Kd2);


T = feedback(C1*C2*G,H);

%step(T)