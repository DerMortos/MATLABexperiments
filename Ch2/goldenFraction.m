% p = '1';
% n = 6;
% for k = 2:n
%     p = ['1 + 1/(' p ')'];
% end
% disp(p)

% now % phi_n expressed as p_n / q_n
p = 1;
q = 0;
for k = 2:n
    t = p;
    p = p+q;
    q = t;
end
% when comparing phi(n) to fibonacci, keep in mind that 
% fibonacci starts index 1 while golden ratio has index 0
fprintf('phi = %d / %d\n', p,q);