function [ t , vout ] = Ralston( VinFunc, R, L, i0, tf, n )
%RALSTON METHOD FOR LR HIGH PASS FILTER
%   Computes output voltage against time for an LR high pass filter. This
%   function uses the rate in change of current to derive the output
%   voltage, current through the resistor could also be used.

    %Local function defines circuit equation
    function [answer] = didt(t,i)
      answer = (VinFunc(t) - R*i)/L;
    end
    
    
    h = tf/(n);         %interval
    tmpi = i0;          %Temporary variable holding current value
    %iDelta = [];        %Array to contain di/dt samples
    iDelta = zeros(1,n+1);
    
    %for t = 0:h:tf
    for i = 1:(n+1)
        t = i*h;
        k1 = didt(t,tmpi);
        k2 = didt(t + (2/3)*h, tmpi + (2/3)*k1*h);
        tmpi = tmpi + h*(0.25*k1 + 0.75*k2);
        %iDelta = [iDelta k1];
        iDelta(i) = k1;
    end
    
    vout = iDelta.*L;   %conversion into output voltages
    t = 0:h:tf;         %corresponding time values    
    
end

