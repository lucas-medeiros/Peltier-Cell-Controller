%% gettfparams: Gets paramaters for a transfer function
function [K, Tau, Theta] = gettfparamsdesc(t, u, y)
%% Initialize variables
deltay = max(y) - min(y);
deltau = max(u) - min(u);
y98 =  y(1) - 0.02*deltay;
y90 = y(1) - 0.10*deltay;
y10 = y(1) - 0.90*deltay ;
%% Find K
K = deltay/deltau;

%% Find Tau
i = 1;
while(y(i) > y90)
   i = i + 1;
end
t1 = t(i);

i = 1;
while(y(i) > y10)
   i = i + 1;
end
t2 = t(i);

tr = t2-t1;
Tau = tr/log(9);
%% Find Theta
i = 1;
while(y(i) > y98)
   i = i + 1;
end
Theta = t(i)-t(1);

end
