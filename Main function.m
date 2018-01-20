%%%%Abishek Chandrasekhar
%%Robot Control_HW_#6
%%Problem 1_1
%%Main program

%%Time
tspan = [0 100];
x0 = [0, 0, 0, 0]'; %%initial conditions

[t,x] = ode45('EOM', tspan, x0);

figure
plot(t,x(:,1),'R') %%%% q1 response
hold on
plot(t,x(:,3),'B') %%%% q2 response 
title('Link Response of q1 and q2 over 40 seconds');
xlabel('time');
ylabel('Angle of link 1 and link 2');
legend('q1', 'q2')

figure 
plot(x(:,1),x(:,2),'R') %%%% q1dot(q1)
title('Phase space trajectories of q1dot(q1)');
xlabel('q1');
ylabel('q1dot');
legend('q1dot(q1)');

figure
plot(x(:,3),x(:,4),'B') %%%% q2dot(q2) 
title('Phase space trajectories of q2dot(q2)');
xlabel('q2');
ylabel('q2dot');
legend('q2dot(q2)');