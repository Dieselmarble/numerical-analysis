%error analysis
R=0.5;
L=1.5e-3;
%Sine wave 150
t0 = 0; %set start time
T = 150e-6; %set time period
fre=1/T; %frequency
tf = T; %set finish time
N = 100; %set number of intervals
i_0 = 0; %initial condition of current
Input = @(t) 6*cos(t*2*pi*fre); %define input signal
exact_c = -(6*T^2*R)/(T^2*R^2+4*pi^2*L^2);
exact_i = @(t) (12*pi*T*L*sin(2*pi*t/T)+6*T^2*R*cos(2*pi*t/T))/(T^2*R^2+4*pi^2*L^2)+ exact_c*exp(-R*t/L);
%exact solution
max_ind = 5; %define maxindex fo array size
h_a = zeros(max_ind,1); %array for step sizes
max_herror= zeros(max_ind,1); %arrays for max errors

%error function for Heun's
for ind=1:max_ind
N=10^ind;  %boost N to get a large number of intervals
h=((tf-t0)/N); %define step size
h_a(ind) = h;  %creat an array for all values of h
[t,vout] = Heun(Input,i_0,t0,tf,N,R,L); %get the output voltage array
vin=arrayfun(Input,t); %input voltages
actual_i = arrayfun(exact_i,t); %exact current at t
actual_vout = vin - R*actual_i; %exact Vout at t
error = actual_vout - vout;%get error by subtract 
%numerical solution from exact solution
[maximum,index] = max(abs(error)); %find the maximum error
max_herror(ind) = maximum; %store maxium error in anarray
end
figure;
subplot(3,2,1);
plot(log(h_a),log(max_herror));%log-log plot of max_error and h
xlabel('log(h)') % x-axis label
ylabel('log(Max Error)') % y-axis label
title('Error analysis Heun');
grad = polyfit(log(h_a),log(max_herror),1); %calculate the gradient of the line
text(-20,-10,['Gradient = ' num2str(grad(1))]);
subplot(3,2,2);
plot(t,abs(error)); %plot the error against time
title('Heuns Error');
hold on;
%error function for Ralston
for ind=1:max_ind
N=10^ind;  %boost N to get a large number of intervals
h=((tf-t0)/N); %define step size
h_a(ind) = h;  %creat an array for all values of h
[t,vout] = Ralston( Input, R, L, i_0, tf, N ); %get the output voltage array
vin=arrayfun(Input,t); %input voltages
actual_i = arrayfun(exact_i,t); %exact current at t
actual_vout = vin - R*actual_i; %exact Vout at t
error = actual_vout - vout;
[maximum,index] = max(abs(error)); %find the maximum error
max_herror(ind) = maximum; %store maxium error in anarray
end
subplot(3,2,3);
plot(log(h_a),log(max_herror)); %log-log plot of max_error and h
xlabel('log(h)') % x-axis label
ylabel('log(Max Error)') % y-axis label
title('Error analysis Ralston');
grad = polyfit(log(h_a),log(max_herror),1); %calculate the gradient of the line
text(-20,-10,['Gradient = ' num2str(grad(1))]);
subplot(3,2,4);
plot(t,abs(error)); %plot the error against time
title('Ralston Error');
hold on;
%error function for Midpoint
for ind=1:max_ind
N=10^ind;  %boost N to get a large number of intervals
h=((tf-t0)/N); %define step size
h_a(ind) = h;  %creat an array for all values of h
[vout,t] = midpoint2(Input,i_0,t0,tf,R,L,N); %get the output voltage array
vin=arrayfun(Input,t); %input voltages
actual_i = arrayfun(exact_i,t); %exact current at t
actual_vout = vin - R*actual_i; %exact Vout at t
error = actual_vout - vout;
[maximum,index] = max(abs(error)); %find the maximum error
max_herror(ind) = maximum; %store maxium error in anarray
end
subplot(3,2,5);
plot(log(h_a),log(max_herror)); %log-log plot of max_error and h
xlabel('log(h)') % x-axis label
ylabel('log(Max Error)') % y-axis label
title('Error analysis Midpoint');
grad = polyfit(log(h_a),log(max_herror),1); %calculate the gradient of the line
text(-20,-10,['Gradient = ' num2str(grad(1))]);
subplot(3,2,6);
plot(t,abs(error)); %plot the error against time
title('Midpoint Error');
hold on;


