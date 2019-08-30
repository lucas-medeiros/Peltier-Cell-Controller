%% gettfparams: Gets paramaters for a transfer function
function [K, Tau, Theta] = gettfparams(t, u, y)
%% Initialize variables
deltay = max(y) - min(y);
deltau = max(u) - min(u);
y2 = 0.02*deltay + y(1);
y10 = 0.10*deltay + y(1);
y90 = 0.90*deltay + y(1);
%% Find K
K = deltay/deltau;

%% Find Tau
i = 1;
while(y(i) < y10)
   i = i + 1;
end
t1 = t(i);

i = 1;
while(y(i) < y90)
   i = i + 1;
end
t2 = t(i);

tr = t2-t1;
Tau = tr/log(9);
%% Find Theta
i = 1;
while(y(i) < y2)
   i = i + 1;
end
Theta = t(i)-t(1);

end