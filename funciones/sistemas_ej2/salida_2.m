function y=salida_2(x)
   %y_f2=x[n] + (1/16)*x[n-35.280] - (1/32)*x[n-44.100] 
    for i=1:35280
    y(i) = 1*x(i);
    end
    
    for i = 35281:44100
        y(i) = x(i) +(1/16)*x(i-35280);
    end
    
    for i = 44101:length(x)
        y(i) = x(i) +(1/16)*x(i-35280) - (1/32)*x(i-44100);
    end
end
