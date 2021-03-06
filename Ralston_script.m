figure('units','normalized','outerposition',[0 0 1 1])
%generate a full screen figure

%Circuit parameters
R = 0.5;
L = 1.5e-3;

%====================================================================
%Step Input
%====================================================================
%Analysis parameters
i_0 = 0;tf=0.05; N=100; %set 100 intetrvals

%Input function (step given i_0 = 0)
func=@(t) 3.5;

%plot
[T,Vout] = Ralston(func,R,L,i_0,tf,N);
subplot(4,4,1);
plot(T,Vout);
hold on;
axis([-0.005,0.05,-0.1,4])
title('Step input with amplitude of 3.5V')
xlabel('time')
ylabel('Vout') 

%====================================================================
%Impulse with exponential decay
%Time constant = 150us
%====================================================================
%Analysis parameters
tf=0.0005; i_0=0; N=100;

%Input function
V1=3.5; t1=150e-6;
func=@(t) V1*exp(-t^2/t1^2);

%plot
[T,Vout] = Ralston(func,R,L,i_0,tf,N);
subplot(4,4,2);
plot(T,Vout);
hold on;
axis([0,0.0005,0,4])
title('inpulse signal input with decaying(150^2)')
xlabel('time')
ylabel('Vout') 

%====================================================================
%Impulse with exponential decay 2
%Time constant = 150us^2
%====================================================================
%Analysis parameters
tf=0.0005; i_0=0; N=100;

%Input function
V1=3.5; t1=150e-6;
func=@(t)V1*exp(-t/t1);

%plot
[T,Vout] = Ralston(func,R,L,i_0,tf,N);
subplot(4,4,3);
plot(T,Vout);
hold on;
axis([0,0.0005,0,4])
title('inpulse signal input with decaying(150)')
xlabel('time')
ylabel('Vout') 

%====================================================================
%Sine wave Period = 150us
%====================================================================
%Analysis parameters
tf=155e-6; i_0=0; N=100;

%Input Function
V1=4; T=150e-6; f=1/T;
func=@(t) V1*sin(2*pi*f*t); 

%plot
[T,Vout] = Ralston(func,R,L,i_0,tf,N);
subplot(4,4,4);
plot(T,Vout);
hold on;
axis([0,15.5e-5,-4.05,4.05])
title('sine input with T=150')
xlabel('time')
ylabel('Vout') 

%====================================================================
%Sine wave period = 15us
%====================================================================
%Analysis parameters
tf=15.5e-6; i_0=0; N=100;

%Input function
V1=4; T=15e-6; f=1/T;
func=@(t) V1*sin(2*pi*f*t); 

%plot
[T,Vout] = Ralston(func,R,L,i_0,tf,N);
subplot(4,4,5);
plot(T,Vout);
hold on;
axis([0,15.5e-6,-4.05,4.05])
title('sine input with T=15')
xlabel('time')
ylabel('Vout') 

%====================================================================
%Sine wave period = 400 us
%====================================================================
%Analysis parameters
tf=400.5e-6; i_0=0; N=100;

%input function
V1=4; T=400e-6; f=1/T;
func=@(t) V1*sin(2*pi*f*t); 

%plot
[T,Vout] = Ralston(func,R,L,i_0,tf,N);
subplot(4,4,6);
plot(T,Vout);
hold on;
axis([0,400.5e-6,-4.1, 4.1])
title('sine input with T=400')
xlabel('time')
ylabel('Vout') 

%====================================================================
%Sine wave period = 1100us
%====================================================================
%Analysis parameters
tf=1103e-6; i_0=0; N=100;

%Input function
V1=4; T=1100e-6; f=1/T;
func=@(t) V1*sin(2*pi*f*t);

%plot
[T,Vout] = Ralston(func,R,L,i_0,tf,N);
subplot(4,4,7);
plot(T,Vout);
hold on;
axis([0,1100e-6,-4.2,4.2])
title('sine input with T=1100')
xlabel('time')
ylabel('Vout') 


%====================================================================
%Square period 150 us
%====================================================================
%Analysis parameters
tf=1500e-6; i_0=0; N=100;

%Input Function
V1=4; T=150e-6; f=1/T;
func=@(t) V1*square(2*pi*f*t); 

%plot
[T,Vout] = Ralston(func,R,L,i_0,tf,N);
subplot(4,4,8);
plot(T,Vout);
hold on;
axis([0,1500e-6,-4.05,4.05])
title('square input with T=150')
xlabel('time')
ylabel('Vout') 

%====================================================================
%Square period 15us
%====================================================================
%Analysis parameters
tf=150e-6; i_0=0; N=100;

%Input function
V1=4; T=15e-6; f=1/T;
func=@(t) V1*square(2*pi*f*t); 

%plot
[T,Vout] = Ralston(func,R,L,i_0,tf,N);
subplot(4,4,9);
plot(T,Vout);
hold on;
axis([0,150e-6,-4.05,4.05])
title('square input with T=15')
xlabel('time')
ylabel('Vout') 

%====================================================================
%Square period 400us
%====================================================================
%Analysis parameters
tf=4000e-6; i_0=0; N=100;

%Input function
V1=4; T=400e-6; f=1/T;
func=@(t) V1*square(2*pi*f*t); 

%plot
[T,Vout] = Ralston(func,R,L,i_0,tf,N);
subplot(4,4,10);
plot(T,Vout);
hold on;
axis([0,4000e-6,-4.05,4.05])
title('square input with T=400')
xlabel('time')
ylabel('Vout') 

%====================================================================
%Square period 1100us
%====================================================================
%Analysis parameters
tf=11000e-6; i_0=0; N=100;

%Input function
V1=4; T=1100e-6; f=1/T;
func=@(t) V1*square(2*pi*f*t); 

%Plot
[T,Vout] = Ralston(func,R,L,i_0,tf,N);
subplot(4,4,11);
plot(T,Vout);
hold on;
axis([0,11000e-6,-4.05,4.05])
title('square input with T=1100')
xlabel('time')
ylabel('Vout') 

%====================================================================
%Sawtooth period 150us
%====================================================================
%Analysis parameters
tf=1500e-6; i_0=0; N=100;

%Input function
V1=4; T=150e-6; f=1/T;
func=@(t) V1*sawtooth(2*pi*f*t); 

%plot
[T,Vout] = Ralston(func,R,L,i_0,tf,N);
subplot(4,4,12);
plot(T,Vout);
hold on;
axis([0,1500e-6,-4.05,4.05])
title('sawtooth input with T=150')
xlabel('time')
ylabel('Vout') 

%====================================================================
%Sawtooth period 15us
%====================================================================
%Analysis parameters
tf=150e-6; i_0=0; N=100;

%Input function
V1=4; T=15e-6; f=1/T;
func=@(t) V1*sawtooth(2*pi*f*t); 

%plot
[T,Vout] = Ralston(func,R,L,i_0,tf,N);
subplot(4,4,13);
plot(T,Vout);
hold on;
axis([0,150e-6,-4.05,4.05])
title('sawtooth input with T=15')
xlabel('time')
ylabel('Vout') 

%====================================================================
%Sawtooth period 1100us
%====================================================================
%Analysis parameters
tf=1101e-6; i_0=0; N=100;

%Input Functions
V1=4; T=150e-6; f=1/T;
func=@(t) V1*sawtooth(2*pi*f*t);

%plot
[T,Vout] = Ralston(func,R,L,i_0,tf,N);
subplot(4,4,14);
plot(T,Vout);
hold on;
axis([0,1100e-6,-4.05,4.05])
title('sawtooth input with T=1100')
xlabel('time')
ylabel('Vout') 