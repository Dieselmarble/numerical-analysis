function [Vout,t] = midpoint2(Input,i_0,t0,tf,R,L,N)
h = (tf-t0)/N;     
func = @(vin,i_in)(vin-R*i_in)/L; %vin-Ril/l to predict di/dt 
halfh = h / 2;
t = t0:h:tf;
i = zeros(size(t)); %array of inductor currents 
i(1) = i_0; %set i_L @ t0 
Vout=zeros(size(t)); %array of output voltage
Vout(1) = Input(t0) - R*i_0;
for j = 1 : N;
 v = Input(t(j)); %input voltage at t 
 Vp= Input(t(j)+halfh); %input voltage at half_t 
 Vn= Input(t(j)+h); % input with step increment of h
 % use in Vout 
 i_t = i(j); %inductor current i at t 
 i_pred=i_t + halfh*func(v,i_t); % predicted i 
 gradav=func(Vp,i_pred); % gradient at half
 i(j+1)=i_t+h*gradav; % new i, stored in array
 Vout(j+1) = Vn - R*i(j+1); %output voltage 
end;
end


