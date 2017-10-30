function [value,isterminal,direction] = event_collision(~,y,H1,H2)
    %event_collision Detects intersection of the interfaces or boundaries
    %   Detailed explanation goes here
    
    value = all((y(1:end/2)+H1-0)>0)*...
            all((y(1+end/2:end)+H2-y(1:end/2)-H1)>0)*...
            all((1-y(1+end/2:end)-H2)>0);
    isterminal = 1; % Terminal
    direction = 0; % Any approach direction
    
end

