function y = s3(x,n)
    y(1)=1/4;
    for i = 2 : length(x)
        y(i) = 0.25*x(i) + 0.25*x(i-1) + 0.5*y(i-1);
    end
    y(length(x)+1)=0.25*x(length(x)) + 0.5*y(length(x));

    for j = length(x) + 2:length(n)
        y(j) = 0.5*y(j-1); 
    end
end
