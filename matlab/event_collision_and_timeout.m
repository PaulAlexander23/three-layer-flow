function [value,isterminal,direction] = event_collision_and_timeout(~,y,H1,H2,xStep,timer)
    %event_collision Detects intersection of the interfaces or boundaries
    %   Detailed explanation goes here
    
    value = all((y(1:end/2)+H1-0)>0)*... % Lower wall
            all((y(1+end/2:end)+H2-y(1:end/2)-H1)>0)*... % Interfaces
            all((1-y(1+end/2:end)-H2)>0)*...  % Upper wall
            (abs(sum(y(1:end/2),1).*xStep)<1e-5)*... % Volume fluid 1/2
            (abs(sum(y(1+end/2:end),1).*xStep)<1e-5)*...; % Volume fluid 2/3
            (toc < timer + (24*60 - 5)*60);
    isterminal = 1; % Terminal
    direction = 0; % Any approach direction
    
end
