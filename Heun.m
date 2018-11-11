function [ t,vout ] = Heun(f,i0,t0,tf,N,R,L)
%takes as input f, the function describing vin(t)
increment = @(vin,i_in)(vin-R*i_in)/L;
%di/dt as a function of vin and i 
h=((tf-t0)/N); %get the step size
t=t0:h:tf; %generate an array of each of the times to plot
vout=zeros(size(t)); %generate an output array for Vout
i_L = zeros(size(t)); %array of inductor currents at t
vout(1) = f(t0) - R*i0; %starting values of Vout
i_L(1) = i0; %starting values for current i

for n=1:N % loop for N steps
%define temporary variables to limit array accessing
V=feval(f, t(n)); %evaluate value of input signal at t
Vp=feval (f, t(n+1)); %evaluate value of input signal at t+h
i_t = i_L(n); %get the current value of i
i_pred=i_t + h*increment(V,i_t); % predict for next value of i
grad1=increment(V,i_t); % gradient at t
grad2=increment(Vp,i_pred); % gradient at t+h
grad_ave=0.5*(grad1+grad2); % average gradient
i_L(n+1)=i_t+h*grad_ave; % predict i at t+h again, store it in an array
vout(n+1) = Vp - R*i_L(n+1); %get the output voltage
end
end