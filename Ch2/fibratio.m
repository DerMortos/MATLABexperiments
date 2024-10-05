%% Element-by-element array operations
function f = fibratio(n)
f = zeros(n,1);
fpf = f+f
ftf = f.*f
ff = f.^2
ffdf = ff./f
cosfpi = cos(f*pi)
even = (mod(f,2) == 0)
format rat
r = f(2:n)./f(1:n)


% f(1) = 1;
% f(2) = 2;
% for k = 3:n
%     f(k) = f(k-1) + f(k-2);
% end