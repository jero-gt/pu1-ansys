function y = s2(x)
    y(1) = 0.5*x(1);

    for i = 2:length(x)
        y(i) = 0.5*x(i) - 0.5*x(i-1);
    end

    y(length(x)+1) = -0.5*x(length(x));
end
