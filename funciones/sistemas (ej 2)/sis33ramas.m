function y=sis33ramas(x)
    %y1[n] = x[n] + 0.5*x[n-8820] -0.25*x[n-17640]
    for i=1:8820
    y(i) = 1*x(i);
    end
    for i = 8821:17640
        y(i) = x(i) +0.5*x(i-8820);
    end
    
    for i = 17641:length(x)
        y(i) = x(i) +0.5*x(i-8820) + 0*x(i-17640);
    end

   % y(length(x)+1) = 0.5*x(length(x));
end
