y=0;
m=1;
g=-1;
i = 1;
while(abs(m)>=10^(-6))
    g=-g;
    m = g/(2*i-1);
    y=y+m;
    i=i+1;
end
pai=4*y