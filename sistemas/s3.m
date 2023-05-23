function h = s3(fun,var)
    h(1)=1;
    for i = 2 : length(var)
        h(i) = 0.25*fun(i) + 0.25*fun(i-1) + 0.5*h(i-1);
    end
end
