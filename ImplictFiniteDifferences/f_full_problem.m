function F = f_full_problem( y, Q, s_1, s_2, m_2, m_3 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global D1 D2 D3 D4

y1 = y(1:end/2);
y2 = y(end/2+1:end);

F = [(s_1.*y1.^2.*(-4.*y1.^3.*m_2.*y2.*m_3 + 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.*m_3.^2 - 3.*y1.^3.*m_2.^2.*m_3 + 4.*y1.^3.*y2.*m_3.^2 - 6.*y1.^2.*y2.^2.*m_3.^2 + 4.*y1.*y2.^3.*m_3.^2 + 2.*m_2.*y2.^4.*m_3 + 3.*y1.^2.*m_2.^2.*m_3 - 4.*m_2.*y2.^3.*m_3 - y1.*m_2.^2.*m_3 - 4.*m_2.*y2.*m_3 + 3.*y1.^3.*m_2.^2.*y2.*m_3 - 3.*y1.^3.*m_2.*y2.*m_3.^2 - 3.*y1.^2.*m_2.^2.*y2.^2.*m_3 + 3.*y1.^2.*m_2.*y2.^2.*m_3.^2 + y1.*m_2.^2.*y2.^3.*m_3 - y1.*m_2.*y2.^3.*m_3.^2 - 4.*y1.*m_2.*y2.^3.*m_3 - y1.^4.*m_3.^2 - m_2.^2.*y2.^4 - y2.^4.*m_3.^2 + 4.*m_2.^2.*y2.^3 + 4.*y1.*m_2.*m_3 - m_2.^2 - 6.*m_2.^2.*y2.^2 + 4.*m_2.^2.*y2 + 4.*y1.^3.*m_2.*m_3 - 6.*y1.^2.*m_2.*m_3 + 6.*m_2.*y2.^2.*m_3)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).*(D3*y1).*(D1*y1)) - (s_1.*y1.^3.*(-12.*y1.^2.*m_2.*y2.*m_3.*(D1*y1) + 12.*y1.*m_2.*y2.^2.*m_3.*(D1*y1) + 12.*y1.^2.*m_2.*y2.*m_3.*(D1*y2) + 9.*y1.^2.*m_2.^2.*y2.*m_3.*(D1*y1) - 9.*y1.^2.*m_2.*y2.*m_3.^2.*(D1*y1) - 6.*y1.*m_2.^2.*y2.^2.*m_3.*(D1*y1) - 6.*y1.^2.*m_2.^2.*y2.*m_3.*(D1*y2) + 6.*y1.*m_2.*y2.^2.*m_3.^2.*(D1*y1) + 6.*y1.^2.*m_2.*y2.*m_3.^2.*(D1*y2) + 3.*y1.*m_2.^2.*y2.^2.*m_3.*(D1*y2) - 3.*y1.*m_2.*y2.^2.*m_3.^2.*(D1*y2) - 12.*y1.*m_2.*y2.^2.*m_3.*(D1*y2) - 4.*y1.^3.*m_3.^2.*(D1*y1) + 4.*(D1*y1).*y2.^3.*m_3.^2 - (D1*y1).*m_2.^2.*m_3 + 4.*y1.^3.*(D1*y2).*m_3.^2 + 4.*(D1*y1).*m_2.*m_3 - 12.*m_2.^2.*y2.*(D1*y2) - 4.*m_2.*(D1*y2).*m_3 - 4.*m_2.^2.*y2.^3.*(D1*y2) - 4.*y2.^3.*m_3.^2.*(D1*y2) + 12.*m_2.^2.*y2.^2.*(D1*y2) + 4.*m_2.^2.*(D1*y2) - 12.*m_2.*y2.^2.*m_3.*(D1*y2) + 3.*y1.^3.*m_2.^2.*(D1*y2).*m_3 - 3.*y1.^3.*m_2.*(D1*y2).*m_3.^2 + (D1*y1).*m_2.^2.*y2.^3.*m_3 - (D1*y1).*m_2.*y2.^3.*m_3.^2 - 4.*(D1*y1).*m_2.*y2.^3.*m_3 + 12.*y1.^2.*m_2.*m_3.*(D1*y1) - 12.*y1.*m_2.*m_3.*(D1*y1) + 12.*m_2.*y2.*m_3.*(D1*y2) - 4.*y1.^3.*m_2.*(D1*y2).*m_3 + 4.*y1.^3.*m_2.*m_3.^2.*(D1*y1) - 9.*y1.^2.*m_2.^2.*m_3.*(D1*y1) + 12.*y1.^2.*y2.*m_3.^2.*(D1*y1) - 12.*y1.*y2.^2.*m_3.^2.*(D1*y1) - 12.*y1.^2.*y2.*m_3.^2.*(D1*y2) + 12.*y1.*y2.^2.*m_3.^2.*(D1*y2) + 8.*m_2.*y2.^3.*m_3.*(D1*y2) + 6.*y1.*m_2.^2.*m_3.*(D1*y1))./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).*(D3*y1))./0.3e1 + (s_1.*y1.^3.*(-4.*y1.^3.*m_2.*y2.*m_3 + 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.*m_3.^2 - 3.*y1.^3.*m_2.^2.*m_3 + 4.*y1.^3.*y2.*m_3.^2 - 6.*y1.^2.*y2.^2.*m_3.^2 + 4.*y1.*y2.^3.*m_3.^2 + 2.*m_2.*y2.^4.*m_3 + 3.*y1.^2.*m_2.^2.*m_3 - 4.*m_2.*y2.^3.*m_3 - y1.*m_2.^2.*m_3 - 4.*m_2.*y2.*m_3 + 3.*y1.^3.*m_2.^2.*y2.*m_3 - 3.*y1.^3.*m_2.*y2.*m_3.^2 - 3.*y1.^2.*m_2.^2.*y2.^2.*m_3 + 3.*y1.^2.*m_2.*y2.^2.*m_3.^2 + y1.*m_2.^2.*y2.^3.*m_3 - y1.*m_2.*y2.^3.*m_3.^2 - 4.*y1.*m_2.*y2.^3.*m_3 - y1.^4.*m_3.^2 - m_2.^2.*y2.^4 - y2.^4.*m_3.^2 + 4.*m_2.^2.*y2.^3 + 4.*y1.*m_2.*m_3 - m_2.^2 - 6.*m_2.^2.*y2.^2 + 4.*m_2.^2.*y2 + 4.*y1.^3.*m_2.*m_3 - 6.*y1.^2.*m_2.*m_3 + 6.*m_2.*y2.^2.*m_3)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).^2.*(D3*y1).*(12.*y1.^2.*m_2.*y2.*m_3.*(D1*y1) - 12.*y1.*m_2.*y2.^2.*m_3.*(D1*y1) - 12.*y1.^2.*m_2.*y2.*m_3.*(D1*y2) - 12.*y1.^2.*m_2.^2.*y2.*m_3.*(D1*y1) + 12.*y1.^2.*m_2.*y2.*m_3.^2.*(D1*y1) + 12.*y1.*m_2.^2.*y2.^2.*m_3.*(D1*y1) + 12.*y1.^2.*m_2.^2.*y2.*m_3.*(D1*y2) - 12.*y1.*m_2.*y2.^2.*m_3.^2.*(D1*y1) - 12.*y1.^2.*m_2.*y2.*m_3.^2.*(D1*y2) - 12.*y1.*m_2.^2.*y2.^2.*m_3.*(D1*y2) + 12.*y1.*m_2.*y2.^2.*m_3.^2.*(D1*y2) + 12.*y1.*m_2.*y2.^2.*m_3.*(D1*y2) + 4.*y1.^3.*m_3.^2.*(D1*y1) - 4.*(D1*y1).*y2.^3.*m_3.^2 + 4.*(D1*y1).*m_2.^2.*m_3 - 4.*y1.^3.*(D1*y2).*m_3.^2 - 4.*(D1*y1).*m_2.*m_3 + 12.*m_2.^2.*y2.*(D1*y2) + 4.*m_2.*(D1*y2).*m_3 + 4.*m_2.^2.*y2.^3.*(D1*y2) + 4.*y2.^3.*m_3.^2.*(D1*y2) - 12.*m_2.^2.*y2.^2.*(D1*y2) - 4.*m_2.^2.*(D1*y2) + 12.*m_2.*y2.^2.*m_3.*(D1*y2) - 4.*y1.^3.*m_2.^2.*(D1*y2).*m_3 + 4.*y1.^3.*m_2.*(D1*y2).*m_3.^2 - 4.*(D1*y1).*m_2.^2.*y2.^3.*m_3 + 4.*(D1*y1).*m_2.*y2.^3.*m_3.^2 + 4.*(D1*y1).*m_2.*y2.^3.*m_3 - 12.*y1.^2.*m_2.*m_3.*(D1*y1) + 12.*y1.*m_2.*m_3.*(D1*y1) - 12.*m_2.*y2.*m_3.*(D1*y2) + 4.*y1.^3.*m_2.^2.*m_3.^2.*(D1*y1) + 4.*y1.^3.*m_2.*(D1*y2).*m_3 - 8.*y1.^3.*m_2.*m_3.^2.*(D1*y1) + 12.*y1.^2.*m_2.^2.*m_3.*(D1*y1) - 12.*y1.^2.*y2.*m_3.^2.*(D1*y1) + 12.*y1.*y2.^2.*m_3.^2.*(D1*y1) + 12.*y1.^2.*y2.*m_3.^2.*(D1*y2) - 12.*y1.*y2.^2.*m_3.^2.*(D1*y2) - 8.*m_2.*y2.^3.*m_3.*(D1*y2) - 12.*y1.*m_2.^2.*m_3.*(D1*y1)))./0.3e1 - (s_1.*y1.^3.*(-4.*y1.^3.*m_2.*y2.*m_3 + 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.*m_3.^2 - 3.*y1.^3.*m_2.^2.*m_3 + 4.*y1.^3.*y2.*m_3.^2 - 6.*y1.^2.*y2.^2.*m_3.^2 + 4.*y1.*y2.^3.*m_3.^2 + 2.*m_2.*y2.^4.*m_3 + 3.*y1.^2.*m_2.^2.*m_3 - 4.*m_2.*y2.^3.*m_3 - y1.*m_2.^2.*m_3 - 4.*m_2.*y2.*m_3 + 3.*y1.^3.*m_2.^2.*y2.*m_3 - 3.*y1.^3.*m_2.*y2.*m_3.^2 - 3.*y1.^2.*m_2.^2.*y2.^2.*m_3 + 3.*y1.^2.*m_2.*y2.^2.*m_3.^2 + y1.*m_2.^2.*y2.^3.*m_3 - y1.*m_2.*y2.^3.*m_3.^2 - 4.*y1.*m_2.*y2.^3.*m_3 - y1.^4.*m_3.^2 - m_2.^2.*y2.^4 - y2.^4.*m_3.^2 + 4.*m_2.^2.*y2.^3 + 4.*y1.*m_2.*m_3 - m_2.^2 - 6.*m_2.^2.*y2.^2 + 4.*m_2.^2.*y2 + 4.*y1.^3.*m_2.*m_3 - 6.*y1.^2.*m_2.*m_3 + 6.*m_2.*y2.^2.*m_3)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).*(D4*y1))./0.3e1 - (m_2.*s_2.*y1.*(y2 - 1).^2.*(3.*y1.^3.*m_2.*m_3 - y1.^2.*m_2.*y2.*m_3 - 3.*y1.^3.*m_3 + y1.^2.*y2.*m_3 - 2.*y1.^2.*m_2.*m_3 + y1.*m_2.*y2.^2 - y1.*y2.^2.*m_3 - 3.*m_2.*y2.^3 + 3.*y2.^3.*m_3 + 2.*y1.^2.*m_3 - 2.*y1.*m_2.*y2 + 4.*y1.*y2.*m_3 + 6.*y2.^2.*m_2 - 6.*y2.^2.*m_3 + y1.*m_2 - 3.*y2.*m_2)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).*(D3*y2).*(D1*y1))./0.3e1 - (m_2.*s_2.*y1.^2.*(y2 - 1).*(3.*y1.^3.*m_2.*m_3 - y1.^2.*m_2.*y2.*m_3 - 3.*y1.^3.*m_3 + y1.^2.*y2.*m_3 - 2.*y1.^2.*m_2.*m_3 + y1.*m_2.*y2.^2 - y1.*y2.^2.*m_3 - 3.*m_2.*y2.^3 + 3.*y2.^3.*m_3 + 2.*y1.^2.*m_3 - 2.*y1.*m_2.*y2 + 4.*y1.*y2.*m_3 + 6.*y2.^2.*m_2 - 6.*y2.^2.*m_3 + y1.*m_2 - 3.*y2.*m_2)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).*(D3*y2).*(D1*y2))./0.3e1 - (m_2.*s_2.*y1.^2.*(y2 - 1).^2.*(9.*y1.^2.*m_2.*m_3.*(D1*y1) - 2.*y1.*m_2.*y2.*m_3.*(D1*y1) - y1.^2.*m_2.*(D1*y2).*m_3 - 9.*y1.^2.*m_3.*(D1*y1) + 2.*y1.*y2.*m_3.*(D1*y1) + y1.^2.*(D1*y2).*m_3 - 4.*y1.*m_2.*m_3.*(D1*y1) + (D1*y1).*m_2.*y2.^2 + 2.*y1.*m_2.*y2.*(D1*y2) - (D1*y1).*y2.^2.*m_3 - 2.*y1.*y2.*m_3.*(D1*y2) - 9.*m_2.*y2.^2.*(D1*y2) + 9.*y2.^2.*m_3.*(D1*y2) + 4.*y1.*m_3.*(D1*y1) - 2.*(D1*y1).*m_2.*y2 - 2.*y1.*m_2.*(D1*y2) + 4.*(D1*y1).*y2.*m_3 + 4.*y1.*(D1*y2).*m_3 + 12.*y2.*m_2.*(D1*y2) - 12.*y2.*m_3.*(D1*y2) + (D1*y1).*m_2 - 3.*(D1*y2).*m_2)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).*(D3*y2))./0.6e1 + (m_2.*s_2.*y1.^2.*(y2 - 1).^2.*(3.*y1.^3.*m_2.*m_3 - y1.^2.*m_2.*y2.*m_3 - 3.*y1.^3.*m_3 + y1.^2.*y2.*m_3 - 2.*y1.^2.*m_2.*m_3 + y1.*m_2.*y2.^2 - y1.*y2.^2.*m_3 - 3.*m_2.*y2.^3 + 3.*y2.^3.*m_3 + 2.*y1.^2.*m_3 - 2.*y1.*m_2.*y2 + 4.*y1.*y2.*m_3 + 6.*y2.^2.*m_2 - 6.*y2.^2.*m_3 + y1.*m_2 - 3.*y2.*m_2)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).^2.*(D3*y2).*(12.*y1.^2.*m_2.*y2.*m_3.*(D1*y1) - 12.*y1.*m_2.*y2.^2.*m_3.*(D1*y1) - 12.*y1.^2.*m_2.*y2.*m_3.*(D1*y2) - 12.*y1.^2.*m_2.^2.*y2.*m_3.*(D1*y1) + 12.*y1.^2.*m_2.*y2.*m_3.^2.*(D1*y1) + 12.*y1.*m_2.^2.*y2.^2.*m_3.*(D1*y1) + 12.*y1.^2.*m_2.^2.*y2.*m_3.*(D1*y2) - 12.*y1.*m_2.*y2.^2.*m_3.^2.*(D1*y1) - 12.*y1.^2.*m_2.*y2.*m_3.^2.*(D1*y2) - 12.*y1.*m_2.^2.*y2.^2.*m_3.*(D1*y2) + 12.*y1.*m_2.*y2.^2.*m_3.^2.*(D1*y2) + 12.*y1.*m_2.*y2.^2.*m_3.*(D1*y2) + 4.*y1.^3.*m_3.^2.*(D1*y1) - 4.*(D1*y1).*y2.^3.*m_3.^2 + 4.*(D1*y1).*m_2.^2.*m_3 - 4.*y1.^3.*(D1*y2).*m_3.^2 - 4.*(D1*y1).*m_2.*m_3 + 12.*m_2.^2.*y2.*(D1*y2) + 4.*m_2.*(D1*y2).*m_3 + 4.*m_2.^2.*y2.^3.*(D1*y2) + 4.*y2.^3.*m_3.^2.*(D1*y2) - 12.*m_2.^2.*y2.^2.*(D1*y2) - 4.*m_2.^2.*(D1*y2) + 12.*m_2.*y2.^2.*m_3.*(D1*y2) - 4.*y1.^3.*m_2.^2.*(D1*y2).*m_3 + 4.*y1.^3.*m_2.*(D1*y2).*m_3.^2 - 4.*(D1*y1).*m_2.^2.*y2.^3.*m_3 + 4.*(D1*y1).*m_2.*y2.^3.*m_3.^2 + 4.*(D1*y1).*m_2.*y2.^3.*m_3 - 12.*y1.^2.*m_2.*m_3.*(D1*y1) + 12.*y1.*m_2.*m_3.*(D1*y1) - 12.*m_2.*y2.*m_3.*(D1*y2) + 4.*y1.^3.*m_2.^2.*m_3.^2.*(D1*y1) + 4.*y1.^3.*m_2.*(D1*y2).*m_3 - 8.*y1.^3.*m_2.*m_3.^2.*(D1*y1) + 12.*y1.^2.*m_2.^2.*m_3.*(D1*y1) - 12.*y1.^2.*y2.*m_3.^2.*(D1*y1) + 12.*y1.*y2.^2.*m_3.^2.*(D1*y1) + 12.*y1.^2.*y2.*m_3.^2.*(D1*y2) - 12.*y1.*y2.^2.*m_3.^2.*(D1*y2) - 8.*m_2.*y2.^3.*m_3.*(D1*y2) - 12.*y1.*m_2.^2.*m_3.*(D1*y1)))./0.6e1 - (m_2.*s_2.*y1.^2.*(y2 - 1).^2.*(3.*y1.^3.*m_2.*m_3 - y1.^2.*m_2.*y2.*m_3 - 3.*y1.^3.*m_3 + y1.^2.*y2.*m_3 - 2.*y1.^2.*m_2.*m_3 + y1.*m_2.*y2.^2 - y1.*y2.^2.*m_3 - 3.*m_2.*y2.^3 + 3.*y2.^3.*m_3 + 2.*y1.^2.*m_3 - 2.*y1.*m_2.*y2 + 4.*y1.*y2.*m_3 + 6.*y2.^2.*m_2 - 6.*y2.^2.*m_3 + y1.*m_2 - 3.*y2.*m_2)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).*(D4*y2))./0.6e1 + (2.*y1.*m_2.*m_3.*Q.*(y1.^2.*m_2.*m_3 - y1.^2.*m_3 + 2.*y1.*m_2.*y2 - 2.*y1.*y2.*m_3 - 3.*y2.^2.*m_2 + 3.*y2.^2.*m_3 - 2.*y1.*m_2 + 3.*m_2)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).*(D1*y1)) + (y1.^2.*m_2.*m_3.*Q.*(2.*y1.*m_2.*m_3.*(D1*y1) - 2.*y1.*m_3.*(D1*y1) + 2.*(D1*y1).*m_2.*y2 + 2.*y1.*m_2.*(D1*y2) - 2.*(D1*y1).*y2.*m_3 - 2.*y1.*(D1*y2).*m_3 - 6.*y2.*m_2.*(D1*y2) + 6.*y2.*m_3.*(D1*y2) - 2.*(D1*y1).*m_2)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3)) - (y1.^2.*m_2.*m_3.*Q.*(y1.^2.*m_2.*m_3 - y1.^2.*m_3 + 2.*y1.*m_2.*y2 - 2.*y1.*y2.*m_3 - 3.*y2.^2.*m_2 + 3.*y2.^2.*m_3 - 2.*y1.*m_2 + 3.*m_2)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).^2.*(12.*y1.^2.*m_2.*y2.*m_3.*(D1*y1) - 12.*y1.*m_2.*y2.^2.*m_3.*(D1*y1) - 12.*y1.^2.*m_2.*y2.*m_3.*(D1*y2) - 12.*y1.^2.*m_2.^2.*y2.*m_3.*(D1*y1) + 12.*y1.^2.*m_2.*y2.*m_3.^2.*(D1*y1) + 12.*y1.*m_2.^2.*y2.^2.*m_3.*(D1*y1) + 12.*y1.^2.*m_2.^2.*y2.*m_3.*(D1*y2) - 12.*y1.*m_2.*y2.^2.*m_3.^2.*(D1*y1) - 12.*y1.^2.*m_2.*y2.*m_3.^2.*(D1*y2) - 12.*y1.*m_2.^2.*y2.^2.*m_3.*(D1*y2) + 12.*y1.*m_2.*y2.^2.*m_3.^2.*(D1*y2) + 12.*y1.*m_2.*y2.^2.*m_3.*(D1*y2) + 4.*y1.^3.*m_3.^2.*(D1*y1) - 4.*(D1*y1).*y2.^3.*m_3.^2 + 4.*(D1*y1).*m_2.^2.*m_3 - 4.*y1.^3.*(D1*y2).*m_3.^2 - 4.*(D1*y1).*m_2.*m_3 + 12.*m_2.^2.*y2.*(D1*y2) + 4.*m_2.*(D1*y2).*m_3 + 4.*m_2.^2.*y2.^3.*(D1*y2) + 4.*y2.^3.*m_3.^2.*(D1*y2) - 12.*m_2.^2.*y2.^2.*(D1*y2) - 4.*m_2.^2.*(D1*y2) + 12.*m_2.*y2.^2.*m_3.*(D1*y2) - 4.*y1.^3.*m_2.^2.*(D1*y2).*m_3 + 4.*y1.^3.*m_2.*(D1*y2).*m_3.^2 - 4.*(D1*y1).*m_2.^2.*y2.^3.*m_3 + 4.*(D1*y1).*m_2.*y2.^3.*m_3.^2 + 4.*(D1*y1).*m_2.*y2.^3.*m_3 - 12.*y1.^2.*m_2.*m_3.*(D1*y1) + 12.*y1.*m_2.*m_3.*(D1*y1) - 12.*m_2.*y2.*m_3.*(D1*y2) + 4.*y1.^3.*m_2.^2.*m_3.^2.*(D1*y1) + 4.*y1.^3.*m_2.*(D1*y2).*m_3 - 8.*y1.^3.*m_2.*m_3.^2.*(D1*y1) + 12.*y1.^2.*m_2.^2.*m_3.*(D1*y1) - 12.*y1.^2.*y2.*m_3.^2.*(D1*y1) + 12.*y1.*y2.^2.*m_3.^2.*(D1*y1) + 12.*y1.^2.*y2.*m_3.^2.*(D1*y2) - 12.*y1.*y2.^2.*m_3.^2.*(D1*y2) - 8.*m_2.*y2.^3.*m_3.*(D1*y2) - 12.*y1.*m_2.^2.*m_3.*(D1*y1)));...
    -((y1.*m_2.*s_1.*(y2 - 1).^2.*(3.*y1.^3.*m_2.*m_3 - y1.^2.*m_2.*y2.*m_3 - 3.*y1.^3.*m_3 + y1.^2.*y2.*m_3 - 2.*y1.^2.*m_2.*m_3 + y1.*m_2.*y2.^2 - y1.*y2.^2.*m_3 - 3.*m_2.*y2.^3 + 3.*y2.^3.*m_3 + 2.*y1.^2.*m_3 - 2.*y1.*m_2.*y2 + 4.*y1.*y2.*m_3 + 6.*y2.^2.*m_2 - 6.*y2.^2.*m_3 + y1.*m_2 - 3.*y2.*m_2)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).*(D3*y1).*(D1*y1))./0.3e1 + (y1.^2.*m_2.*s_1.*(y2 - 1).*(3.*y1.^3.*m_2.*m_3 - y1.^2.*m_2.*y2.*m_3 - 3.*y1.^3.*m_3 + y1.^2.*y2.*m_3 - 2.*y1.^2.*m_2.*m_3 + y1.*m_2.*y2.^2 - y1.*y2.^2.*m_3 - 3.*m_2.*y2.^3 + 3.*y2.^3.*m_3 + 2.*y1.^2.*m_3 - 2.*y1.*m_2.*y2 + 4.*y1.*y2.*m_3 + 6.*y2.^2.*m_2 - 6.*y2.^2.*m_3 + y1.*m_2 - 3.*y2.*m_2)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).*(D3*y1).*(D1*y2))./0.3e1 + (y1.^2.*m_2.*s_1.*(y2 - 1).^2.*(9.*y1.^2.*m_2.*m_3.*(D1*y1) - 2.*y1.*m_2.*y2.*m_3.*(D1*y1) - y1.^2.*m_2.*(D1*y2).*m_3 - 9.*y1.^2.*m_3.*(D1*y1) + 2.*y1.*y2.*m_3.*(D1*y1) + y1.^2.*(D1*y2).*m_3 - 4.*y1.*m_2.*m_3.*(D1*y1) + (D1*y1).*m_2.*y2.^2 + 2.*y1.*m_2.*y2.*(D1*y2) - (D1*y1).*y2.^2.*m_3 - 2.*y1.*y2.*m_3.*(D1*y2) - 9.*m_2.*y2.^2.*(D1*y2) + 9.*y2.^2.*m_3.*(D1*y2) + 4.*y1.*m_3.*(D1*y1) - 2.*(D1*y1).*m_2.*y2 - 2.*y1.*m_2.*(D1*y2) + 4.*(D1*y1).*y2.*m_3 + 4.*y1.*(D1*y2).*m_3 + 12.*y2.*m_2.*(D1*y2) - 12.*y2.*m_3.*(D1*y2) + (D1*y1).*m_2 - 3.*(D1*y2).*m_2)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).*(D3*y1))./0.6e1 - (y1.^2.*m_2.*s_1.*(y2 - 1).^2.*(3.*y1.^3.*m_2.*m_3 - y1.^2.*m_2.*y2.*m_3 - 3.*y1.^3.*m_3 + y1.^2.*y2.*m_3 - 2.*y1.^2.*m_2.*m_3 + y1.*m_2.*y2.^2 - y1.*y2.^2.*m_3 - 3.*m_2.*y2.^3 + 3.*y2.^3.*m_3 + 2.*y1.^2.*m_3 - 2.*y1.*m_2.*y2 + 4.*y1.*y2.*m_3 + 6.*y2.^2.*m_2 - 6.*y2.^2.*m_3 + y1.*m_2 - 3.*y2.*m_2)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).^2.*(D3*y1).*(12.*y1.^2.*m_2.*y2.*m_3.*(D1*y1) - 12.*y1.*m_2.*y2.^2.*m_3.*(D1*y1) - 12.*y1.^2.*m_2.*y2.*m_3.*(D1*y2) - 12.*y1.^2.*m_2.^2.*y2.*m_3.*(D1*y1) + 12.*y1.^2.*m_2.*y2.*m_3.^2.*(D1*y1) + 12.*y1.*m_2.^2.*y2.^2.*m_3.*(D1*y1) + 12.*y1.^2.*m_2.^2.*y2.*m_3.*(D1*y2) - 12.*y1.*m_2.*y2.^2.*m_3.^2.*(D1*y1) - 12.*y1.^2.*m_2.*y2.*m_3.^2.*(D1*y2) - 12.*y1.*m_2.^2.*y2.^2.*m_3.*(D1*y2) + 12.*y1.*m_2.*y2.^2.*m_3.^2.*(D1*y2) + 12.*y1.*m_2.*y2.^2.*m_3.*(D1*y2) + 4.*y1.^3.*m_3.^2.*(D1*y1) - 4.*(D1*y1).*y2.^3.*m_3.^2 + 4.*(D1*y1).*m_2.^2.*m_3 - 4.*y1.^3.*(D1*y2).*m_3.^2 - 4.*(D1*y1).*m_2.*m_3 + 12.*m_2.^2.*y2.*(D1*y2) + 4.*m_2.*(D1*y2).*m_3 + 4.*m_2.^2.*y2.^3.*(D1*y2) + 4.*y2.^3.*m_3.^2.*(D1*y2) - 12.*m_2.^2.*y2.^2.*(D1*y2) - 4.*m_2.^2.*(D1*y2) + 12.*m_2.*y2.^2.*m_3.*(D1*y2) - 4.*y1.^3.*m_2.^2.*(D1*y2).*m_3 + 4.*y1.^3.*m_2.*(D1*y2).*m_3.^2 - 4.*(D1*y1).*m_2.^2.*y2.^3.*m_3 + 4.*(D1*y1).*m_2.*y2.^3.*m_3.^2 + 4.*(D1*y1).*m_2.*y2.^3.*m_3 - 12.*y1.^2.*m_2.*m_3.*(D1*y1) + 12.*y1.*m_2.*m_3.*(D1*y1) - 12.*m_2.*y2.*m_3.*(D1*y2) + 4.*y1.^3.*m_2.^2.*m_3.^2.*(D1*y1) + 4.*y1.^3.*m_2.*(D1*y2).*m_3 - 8.*y1.^3.*m_2.*m_3.^2.*(D1*y1) + 12.*y1.^2.*m_2.^2.*m_3.*(D1*y1) - 12.*y1.^2.*y2.*m_3.^2.*(D1*y1) + 12.*y1.*y2.^2.*m_3.^2.*(D1*y1) + 12.*y1.^2.*y2.*m_3.^2.*(D1*y2) - 12.*y1.*y2.^2.*m_3.^2.*(D1*y2) - 8.*m_2.*y2.^3.*m_3.*(D1*y2) - 12.*y1.*m_2.^2.*m_3.*(D1*y1)))./0.6e1 + (y1.^2.*m_2.*s_1.*(y2 - 1).^2.*(3.*y1.^3.*m_2.*m_3 - y1.^2.*m_2.*y2.*m_3 - 3.*y1.^3.*m_3 + y1.^2.*y2.*m_3 - 2.*y1.^2.*m_2.*m_3 + y1.*m_2.*y2.^2 - y1.*y2.^2.*m_3 - 3.*m_2.*y2.^3 + 3.*y2.^3.*m_3 + 2.*y1.^2.*m_3 - 2.*y1.*m_2.*y2 + 4.*y1.*y2.*m_3 + 6.*y2.^2.*m_2 - 6.*y2.^2.*m_3 + y1.*m_2 - 3.*y2.*m_2)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).*(D4*y1))./0.6e1 + (s_2.*(y2 - 1).^2.*(y1.^4.*m_2.^2.*m_3 - 2.*y1.^4.*m_2.*m_3 - y1.^3.*m_2.^2.*y2 + 4.*y1.^3.*m_2.*y2.*m_3 + 3.*y1.^2.*m_2.^2.*y2.^2 - 6.*y1.^2.*m_2.*y2.^2.*m_3 - 3.*y1.*m_2.^2.*y2.^3 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3 + y1.^3.*m_2.*y2 - 4.*y1.^3.*y2.*m_3 + y1.^3.*m_2.^2 - 3.*y1.^2.*m_2.*y2.^2 + 6.*y1.^2.*y2.^2.*m_3 - 3.*y1.^2.*m_2.^2.*y2 + 3.*y1.*m_2.*y2.^3 - 4.*y1.*y2.^3.*m_3 + 3.*y1.*m_2.^2.*y2.^2 - m_2.*y2.^4 + y2.^4.*m_3 - y1.^3.*m_2 + 3.*y1.^2.*m_2.*y2 - 3.*y1.*m_2.*y2.^2 + m_2.*y2.^3)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).*(D3*y2).*(D1*y2)) + (s_2.*(y2 - 1).^3.*(-9.*y1.*m_2.^2.*y2.^2.*(D1*y2) + 3.*y1.^2.*m_2.*y2.*(D1*y1) - 12.*y1.^2.*y2.*m_3.*(D1*y1) - 6.*y1.*m_2.*y2.^2.*(D1*y1) - 6.*y1.^2.*m_2.*y2.*(D1*y2) + 12.*y1.*y2.^2.*m_3.*(D1*y1) + 12.*y1.^2.*y2.*m_3.*(D1*y2) - 6.*y1.*m_2.^2.*y2.*(D1*y1) + 9.*y1.*m_2.*y2.^2.*(D1*y2) - 12.*y1.*y2.^2.*m_3.*(D1*y2) + 6.*y1.*m_2.^2.*y2.*(D1*y2) + 6.*y1.*m_2.*y2.*(D1*y1) - 8.*y1.^3.*m_2.*m_3.*(D1*y1) - 3.*y1.^2.*m_2.^2.*y2.*(D1*y1) + 6.*y1.*m_2.^2.*y2.^2.*(D1*y1) + 6.*y1.^2.*m_2.^2.*y2.*(D1*y2) + 4.*y1.^3.*m_2.^2.*m_3.*(D1*y1) + 12.*y1.^2.*m_2.*y2.*m_3.*(D1*y1) - 12.*y1.*m_2.*y2.^2.*m_3.*(D1*y1) - 12.*y1.^2.*m_2.*y2.*m_3.*(D1*y2) + 12.*y1.*m_2.*y2.^2.*m_3.*(D1*y2) - 3.*(D1*y1).*m_2.*y2.^2 + 3.*m_2.*y2.^2.*(D1*y2) + 4.*(D1*y1).*m_2.*y2.^3.*m_3 - 6.*y1.*m_2.*y2.*(D1*y2) + 4.*y1.^3.*m_2.*(D1*y2).*m_3 - 3.*y1.^2.*m_2.^2.*(D1*y2) + 3.*(D1*y1).*m_2.*y2.^3 - 4.*(D1*y1).*y2.^3.*m_3 + 3.*(D1*y1).*m_2.^2.*y2.^2 - 4.*m_2.*y2.^3.*(D1*y2) + 4.*y2.^3.*m_3.*(D1*y2) - 3.*y1.^2.*m_2.*(D1*y1) + 3.*y1.^2.*m_2.*(D1*y2) - y1.^3.*m_2.^2.*(D1*y2) - 3.*(D1*y1).*m_2.^2.*y2.^3 + 4.*y1.^3.*m_3.*(D1*y1) + y1.^3.*m_2.*(D1*y2) - 4.*y1.^3.*(D1*y2).*m_3 + 3.*y1.^2.*m_2.^2.*(D1*y1))./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).*(D3*y2))./0.3e1 - (s_2.*(y2 - 1).^3.*(y1.^4.*m_2.^2.*m_3 - 2.*y1.^4.*m_2.*m_3 - y1.^3.*m_2.^2.*y2 + 4.*y1.^3.*m_2.*y2.*m_3 + 3.*y1.^2.*m_2.^2.*y2.^2 - 6.*y1.^2.*m_2.*y2.^2.*m_3 - 3.*y1.*m_2.^2.*y2.^3 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3 + y1.^3.*m_2.*y2 - 4.*y1.^3.*y2.*m_3 + y1.^3.*m_2.^2 - 3.*y1.^2.*m_2.*y2.^2 + 6.*y1.^2.*y2.^2.*m_3 - 3.*y1.^2.*m_2.^2.*y2 + 3.*y1.*m_2.*y2.^3 - 4.*y1.*y2.^3.*m_3 + 3.*y1.*m_2.^2.*y2.^2 - m_2.*y2.^4 + y2.^4.*m_3 - y1.^3.*m_2 + 3.*y1.^2.*m_2.*y2 - 3.*y1.*m_2.*y2.^2 + m_2.*y2.^3)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).^2.*(D3*y2).*(12.*y1.^2.*m_2.*y2.*m_3.*(D1*y1) - 12.*y1.*m_2.*y2.^2.*m_3.*(D1*y1) - 12.*y1.^2.*m_2.*y2.*m_3.*(D1*y2) - 12.*y1.^2.*m_2.^2.*y2.*m_3.*(D1*y1) + 12.*y1.^2.*m_2.*y2.*m_3.^2.*(D1*y1) + 12.*y1.*m_2.^2.*y2.^2.*m_3.*(D1*y1) + 12.*y1.^2.*m_2.^2.*y2.*m_3.*(D1*y2) - 12.*y1.*m_2.*y2.^2.*m_3.^2.*(D1*y1) - 12.*y1.^2.*m_2.*y2.*m_3.^2.*(D1*y2) - 12.*y1.*m_2.^2.*y2.^2.*m_3.*(D1*y2) + 12.*y1.*m_2.*y2.^2.*m_3.^2.*(D1*y2) + 12.*y1.*m_2.*y2.^2.*m_3.*(D1*y2) + 4.*y1.^3.*m_3.^2.*(D1*y1) - 4.*(D1*y1).*y2.^3.*m_3.^2 + 4.*(D1*y1).*m_2.^2.*m_3 - 4.*y1.^3.*(D1*y2).*m_3.^2 - 4.*(D1*y1).*m_2.*m_3 + 12.*m_2.^2.*y2.*(D1*y2) + 4.*m_2.*(D1*y2).*m_3 + 4.*m_2.^2.*y2.^3.*(D1*y2) + 4.*y2.^3.*m_3.^2.*(D1*y2) - 12.*m_2.^2.*y2.^2.*(D1*y2) - 4.*m_2.^2.*(D1*y2) + 12.*m_2.*y2.^2.*m_3.*(D1*y2) - 4.*y1.^3.*m_2.^2.*(D1*y2).*m_3 + 4.*y1.^3.*m_2.*(D1*y2).*m_3.^2 - 4.*(D1*y1).*m_2.^2.*y2.^3.*m_3 + 4.*(D1*y1).*m_2.*y2.^3.*m_3.^2 + 4.*(D1*y1).*m_2.*y2.^3.*m_3 - 12.*y1.^2.*m_2.*m_3.*(D1*y1) + 12.*y1.*m_2.*m_3.*(D1*y1) - 12.*m_2.*y2.*m_3.*(D1*y2) + 4.*y1.^3.*m_2.^2.*m_3.^2.*(D1*y1) + 4.*y1.^3.*m_2.*(D1*y2).*m_3 - 8.*y1.^3.*m_2.*m_3.^2.*(D1*y1) + 12.*y1.^2.*m_2.^2.*m_3.*(D1*y1) - 12.*y1.^2.*y2.*m_3.^2.*(D1*y1) + 12.*y1.*y2.^2.*m_3.^2.*(D1*y1) + 12.*y1.^2.*y2.*m_3.^2.*(D1*y2) - 12.*y1.*y2.^2.*m_3.^2.*(D1*y2) - 8.*m_2.*y2.^3.*m_3.*(D1*y2) - 12.*y1.*m_2.^2.*m_3.*(D1*y1)))./0.3e1 + (s_2.*(y2 - 1).^3.*(y1.^4.*m_2.^2.*m_3 - 2.*y1.^4.*m_2.*m_3 - y1.^3.*m_2.^2.*y2 + 4.*y1.^3.*m_2.*y2.*m_3 + 3.*y1.^2.*m_2.^2.*y2.^2 - 6.*y1.^2.*m_2.*y2.^2.*m_3 - 3.*y1.*m_2.^2.*y2.^3 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3 + y1.^3.*m_2.*y2 - 4.*y1.^3.*y2.*m_3 + y1.^3.*m_2.^2 - 3.*y1.^2.*m_2.*y2.^2 + 6.*y1.^2.*y2.^2.*m_3 - 3.*y1.^2.*m_2.^2.*y2 + 3.*y1.*m_2.*y2.^3 - 4.*y1.*y2.^3.*m_3 + 3.*y1.*m_2.^2.*y2.^2 - m_2.*y2.^4 + y2.^4.*m_3 - y1.^3.*m_2 + 3.*y1.^2.*m_2.*y2 - 3.*y1.*m_2.*y2.^2 + m_2.*y2.^3)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).*(D4*y2))./0.3e1 - (2.*m_2.*Q.*(y2 - 1).*(3.*y1.^2.*m_2.*m_3 - 2.*y1.*m_2.*y2.*m_3 - 3.*y1.^2.*m_3 + 2.*y1.*y2.*m_3 - 4.*y1.*m_2.*m_3 - y2.^2.*m_2 + y2.^2.*m_3 + 4.*m_3.*y1 + 2.*y2.*m_2 - 4.*y2.*m_3 - m_2)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).*(D1*y2)) - (m_2.*Q.*(y2 - 1).^2.*(6.*y1.*m_2.*m_3.*(D1*y1) - 2.*(D1*y1).*m_2.*y2.*m_3 - 2.*y1.*m_2.*(D1*y2).*m_3 - 6.*y1.*m_3.*(D1*y1) + 2.*(D1*y1).*y2.*m_3 + 2.*y1.*(D1*y2).*m_3 - 4.*(D1*y1).*m_2.*m_3 - 2.*y2.*m_2.*(D1*y2) + 2.*y2.*m_3.*(D1*y2) + 4.*m_3.*(D1*y1) + 2.*(D1*y2).*m_2 - 4.*(D1*y2).*m_3)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3)) + (m_2.*Q.*(y2 - 1).^2.*(3.*y1.^2.*m_2.*m_3 - 2.*y1.*m_2.*y2.*m_3 - 3.*y1.^2.*m_3 + 2.*y1.*y2.*m_3 - 4.*y1.*m_2.*m_3 - y2.^2.*m_2 + y2.^2.*m_3 + 4.*m_3.*y1 + 2.*y2.*m_2 - 4.*y2.*m_3 - m_2)./(4.*y1.^3.*m_2.*y2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3 + y1.^4.*m_2.^2.*m_3.^2 - 2.*y1.^4.*m_2.*m_3.^2 + 4.*y1.^3.*m_2.^2.*m_3 - 4.*y1.^3.*y2.*m_3.^2 + 6.*y1.^2.*y2.^2.*m_3.^2 - 4.*y1.*y2.^3.*m_3.^2 - 2.*m_2.*y2.^4.*m_3 - 6.*y1.^2.*m_2.^2.*m_3 + 4.*m_2.*y2.^3.*m_3 + 4.*y1.*m_2.^2.*m_3 + 4.*m_2.*y2.*m_3 - 4.*y1.^3.*m_2.^2.*y2.*m_3 + 4.*y1.^3.*m_2.*y2.*m_3.^2 + 6.*y1.^2.*m_2.^2.*y2.^2.*m_3 - 6.*y1.^2.*m_2.*y2.^2.*m_3.^2 - 4.*y1.*m_2.^2.*y2.^3.*m_3 + 4.*y1.*m_2.*y2.^3.*m_3.^2 + 4.*y1.*m_2.*y2.^3.*m_3 + y1.^4.*m_3.^2 + m_2.^2.*y2.^4 + y2.^4.*m_3.^2 - 4.*m_2.^2.*y2.^3 - 4.*y1.*m_2.*m_3 + m_2.^2 + 6.*m_2.^2.*y2.^2 - 4.*m_2.^2.*y2 - 4.*y1.^3.*m_2.*m_3 + 6.*y1.^2.*m_2.*m_3 - 6.*m_2.*y2.^2.*m_3).^2.*(12.*y1.^2.*m_2.*y2.*m_3.*(D1*y1) - 12.*y1.*m_2.*y2.^2.*m_3.*(D1*y1) - 12.*y1.^2.*m_2.*y2.*m_3.*(D1*y2) - 12.*y1.^2.*m_2.^2.*y2.*m_3.*(D1*y1) + 12.*y1.^2.*m_2.*y2.*m_3.^2.*(D1*y1) + 12.*y1.*m_2.^2.*y2.^2.*m_3.*(D1*y1) + 12.*y1.^2.*m_2.^2.*y2.*m_3.*(D1*y2) - 12.*y1.*m_2.*y2.^2.*m_3.^2.*(D1*y1) - 12.*y1.^2.*m_2.*y2.*m_3.^2.*(D1*y2) - 12.*y1.*m_2.^2.*y2.^2.*m_3.*(D1*y2) + 12.*y1.*m_2.*y2.^2.*m_3.^2.*(D1*y2) + 12.*y1.*m_2.*y2.^2.*m_3.*(D1*y2) + 4.*y1.^3.*m_3.^2.*(D1*y1) - 4.*(D1*y1).*y2.^3.*m_3.^2 + 4.*(D1*y1).*m_2.^2.*m_3 - 4.*y1.^3.*(D1*y2).*m_3.^2 - 4.*(D1*y1).*m_2.*m_3 + 12.*m_2.^2.*y2.*(D1*y2) + 4.*m_2.*(D1*y2).*m_3 + 4.*m_2.^2.*y2.^3.*(D1*y2) + 4.*y2.^3.*m_3.^2.*(D1*y2) - 12.*m_2.^2.*y2.^2.*(D1*y2) - 4.*m_2.^2.*(D1*y2) + 12.*m_2.*y2.^2.*m_3.*(D1*y2) - 4.*y1.^3.*m_2.^2.*(D1*y2).*m_3 + 4.*y1.^3.*m_2.*(D1*y2).*m_3.^2 - 4.*(D1*y1).*m_2.^2.*y2.^3.*m_3 + 4.*(D1*y1).*m_2.*y2.^3.*m_3.^2 + 4.*(D1*y1).*m_2.*y2.^3.*m_3 - 12.*y1.^2.*m_2.*m_3.*(D1*y1) + 12.*y1.*m_2.*m_3.*(D1*y1) - 12.*m_2.*y2.*m_3.*(D1*y2) + 4.*y1.^3.*m_2.^2.*m_3.^2.*(D1*y1) + 4.*y1.^3.*m_2.*(D1*y2).*m_3 - 8.*y1.^3.*m_2.*m_3.^2.*(D1*y1) + 12.*y1.^2.*m_2.^2.*m_3.*(D1*y1) - 12.*y1.^2.*y2.*m_3.^2.*(D1*y1) + 12.*y1.*y2.^2.*m_3.^2.*(D1*y1) + 12.*y1.^2.*y2.*m_3.^2.*(D1*y2) - 12.*y1.*y2.^2.*m_3.^2.*(D1*y2) - 8.*m_2.*y2.^3.*m_3.*(D1*y2) - 12.*y1.*m_2.^2.*m_3.*(D1*y1))))];

end

