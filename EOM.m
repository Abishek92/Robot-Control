

%%function EOM
%%%Defining the state variables
%%% [x(1) x(2) x(3) x(4)] =  [q1 q1dot q2 q2dot]




function [xdot] = EOM(t,x)

l1 = 1; l2 = 1; m1 = 2; m2 = 1; lc1 = .5; lc2 = .5; I1 = .5; I2 = .25; g =9.81;

xdot = zeros (4,1); %%%%initializing xdot



%%Inertia Matrix D terms
d11 = m1*lc1^2 + m2*(l1^2 + lc2^2 + 2*l1*lc2^2 + 2*l1*lc2*cos(x(3))) + I1 + I2;
d12 = m2*(lc2^2 + l1*lc2*cos(x(3))) + I2;
d21 = d12;
d22 = m2*lc2^2 + I2;

D = [d11 d12; d21 d22];

%%Centrifugal and Coriolis C terms
h = -(m2*l1*lc2*sin(x(3)));
c111 = 0; c121 = h; c211 = h; c221 = h; c112 = -h; c122 = 0; c212 = 0; c222 = 0;

C = [(h*x(4)) (h*(x(4) + x(2))) ; (-h*x(1)) 0]; 



%%Gravity terms
phi1 = (m1*lc1 + m2*l1)*g*cos(x(1)) + m2*lc2*g*cos(x(1)+x(3));
phi2 = m2*lc2*g*cos(x(1)+x(3));


%%Acceleration vector
a1 = - c121*x(2)*x(4) - c211*x(4)*x(2) - c221*x(4)^2 - phi1;
a2 = - c112*x(2)^2 - phi2;
Dinv = inv(D);
Atemp = [a1; a2];
A  = Dinv*Atemp; 
q1ddot = A(1);
q2ddot = A(2);


%%%Required vector xdot
%xdot = [q1dot q1ddot q2dot q2ddot]

xdot(1) = x(2);
xdot(2) = q1ddot;
xdot(3) = x(4);
xdot(4) = q2ddot;



