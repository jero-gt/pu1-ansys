function y=salida_3(x)
%y_f3[n]= x[n] + (1/64)*x[-52.920]
    for i=1:52920
    y(i) = x(i);
    end
    
    for i = 52921: length(x)
        y(i) = x(i) +(1/64)*x(i-52920);
    end
end