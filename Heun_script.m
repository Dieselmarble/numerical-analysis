figure('units','normalized','outerposition',[0 0 1 1])
%generate a full screen figure

%Step Input
R=0.5; L=1.5e-3;
t=0; i_0=0;tf=0.05;% initialize input parameters
N=100; %set 100 intetrvals
func=@(t) 3.5; %Vin is a step signal
[T,Vout] = Heun(func,i_0,t,tf,N,R,L)
subplot(4,4,1);
plot(T,Vout,'*');
hold on;
axis([-0.005,0.05,-0.1,4])
title('Step input with amplitude of 3.5V')
xlabel('time')
ylabel('Vout') 

%Inpulse signal and decaying1
V1=3.5; t1=150e-6;
t=0; tf=0.0005;
i_0=0;
N=100;
func=@(t) V1*exp(-t^2/t1^2); %input signal 
[T,Vout] = Heun(func,i_0,t,tf,N,R,L)
subplot(4,4,2);
plot(T,Vout,'*');
hold on;
axis([0,0.0005,0,4])
title('inpulse signal input with decaying(150^2)')
xlabel('time')
ylabel('Vout') 

%Inpulse signal and decaying2
V1=3.5; t1=150e-6;
t=0; tf=0.0005;
i_0=0; N=100;
func=@(t)V1*exp(-t/t1);
[T,Vout] = Heun(func,i_0,t,tf,N,R,L)
subplot(4,4,3);
plot(T,Vout,'*');
hold on;
axis([0,0.0005,0,4])
title('inpulse signal input with decaying(150)')
xlabel('time')
ylabel('Vout') 

%Sine wave 150
V1=4;
T=150e-6;
f=1/T;
t=0; tf=155e-6;
i_0=0;
N=100;
func=@(t) V1*sin(2*pi*f*t); 
[T,Vout] = Heun(func,i_0,t,tf,N,R,L)
subplot(4,4,4);
plot(T,Vout,'*');
hold on;
axis([0,15.5e-5,-4.05,4.05])
title('sine input with T=150')
xlabel('time')
ylabel('Vout') 

%Sine wave 15
V1=4;
T=15e-6;
f=1/T;
t=0; tf=15.5e-6;
i_0=0;
N=100;
func=@(t) V1*sin(2*pi*f*t); 
[T,Vout] = Heun(func,i_0,t,tf,N,R,L)
subplot(4,4,5);
plot(T,Vout,'*');
hold on;
axis([0,15.5e-6,-4.05,4.05])
title('sine input with T=15')
xlabel('time')
ylabel('Vout') 

%Sine wave 400
V1=4;
T=400e-6;
f=1/T;
t=0; tf=400.5e-6
i_0=0; N=100;
func=@(t) V1*sin(2*pi*f*t); 
[T,Vout] = Heun(func,i_0,t,tf,N,R,L)
subplot(4,4,6);
plot(T,Vout,'*');
hold on;
axis([0,400.5e-6,-4.1, 4.1])
title('sine input with T=400')
xlabel('time')
ylabel('Vout') 

%Sine wave 1100
V1=4;
T=1100e-6;
f=1/T;
t=0;tf=1103e-6
i_0=0; N=100;
func=@(t) V1*sin(2*pi*f*t); 
[T,Vout] = Heun(func,i_0,t,tf,N,R,L)
subplot(4,4,7);
plot(T,Vout,'*');
hold on;
axis([0,1100e-6,-4.2,4.2])
title('sine input with T=1100')
xlabel('time')
ylabel('Vout') 

%Square 150
V1=4;
T=150e-6;
f=1/T;
t=0; tf=1500e-6;
i_0=0;
N=100;
func=@(t) V1*square(2*pi*f*t); 
[T,Vout] = Heun(func,i_0,t,tf,N,R,L)
subplot(4,4,8);
plot(T,Vout);
hold on;
axis([0,1500e-6,-4.05,4.05])
title('square input with T=150')
xlabel('time')
ylabel('Vout') 

%Square 15
V1=4;
T=15e-6;
f=1/T;
t=0; tf=150e-6;
i_0=0;
N=100;
func=@(t) V1*square(2*pi*f*t); 
[T,Vout] = Heun(func,i_0,t,tf,N,R,L)
subplot(4,4,9);
plot(T,Vout);
hold on;
axis([0,150e-6,-4.05,4.05])
title('square input with T=15')
xlabel('time')
ylabel('Vout') 

%Square 400
V1=4;
T=400e-6;
f=1/T;
t=0; tf=4000e-6;
i_0=0;
N=100;
func=@(t) V1*square(2*pi*f*t); 
[T,Vout] = Heun(func,i_0,t,tf,N,R,L)
subplot(4,4,10);
plot(T,Vout);
hold on;
axis([0,4000e-6,-4.05,4.05])
title('square input with T=400')
xlabel('time')
ylabel('Vout') 

%Square 1100
V1=4;
T=1100e-6;
f=1/T;
t=0; tf=11000e-6;
i_0=0;
N=100;
func=@(t) V1*square(2*pi*f*t); 
[T,Vout] = Heun(func,i_0,t,tf,N,R,L)
subplot(4,4,11);
plot(T,Vout);
hold on;
axis([0,11000e-6,-4.05,4.05])
title('square input with T=1100')
xlabel('time')
ylabel('Vout') 

%Sawtooth 150
V1=4;
T=150e-6;
f=1/T;
t=0; tf=1500e-6;
i_0=0;
N=100;
func=@(t) V1*sawtooth(2*pi*f*t); 
[T,Vout] = Heun(func,i_0,t,tf,N,R,L)
subplot(4,4,12);
plot(T,Vout);
hold on;
axis([0,1500e-6,-4.05,4.05])
title('sawtooth input with T=150')
xlabel('time')
ylabel('Vout') 

%Sawtooth 15
V1=4;
T=15e-6;
f=1/T;
t=0; tf=150e-6;
i_0=0;
N=100;
func=@(t) V1*sawtooth(2*pi*f*t); 
[T,Vout] = Heun(func,i_0,t,tf,N,R,L)
subplot(4,4,13);
plot(T,Vout);
hold on;
axis([0,150e-6,-4.05,4.05])
title('sawtooth input with T=15')
xlabel('time')
ylabel('Vout') 

%Sawtooth 1100
V1=4;
T=150e-6;
f=1/T;
t=0; tf=1101e-6;
i_0=0;
N=100;
func=@(t) V1*sawtooth(2*pi*f*t); 
[T,Vout] = Heun(func,i_0,t,tf,N,R,L);
subplot(4,4,14);
plot(T,Vout);
hold on;
axis([0,1100e-6,-4.05,4.05])
title('sawtooth input with T=1100')
xlabel('time')
ylabel('Vout') 



