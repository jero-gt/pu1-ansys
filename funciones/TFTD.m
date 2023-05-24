function [X, s] = TFTD(x,n)
    ds = 0.001; s = [-2:ds:2]; 
    X = zeros(size(s));
    for i = 1:length(s)
        X(i)=sum(x.*exp(-1i*2*pi*s(i)*n));
    end
end
