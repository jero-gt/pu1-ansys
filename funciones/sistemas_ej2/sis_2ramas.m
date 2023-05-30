function y=sis_2ramas(x)
    %y1[n] = x[n] + 1/2*x[n-8820] -1/8*x[n-26460]
    for i=1:8820
    y(i) = 1*x(i);
    end
    for i = 8821:26460
        y(i) = x(i) +0.5*x(i-8820);
    end
    
    for i = 26461:length(x)
        y(i) = x(i) + 1/2*x(i-8820) - 1/8*x(i-26460);
    end

   % y(length(x)+1) = 0.5*x(length(x));
end
