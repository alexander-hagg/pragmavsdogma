%% Pragma vs Dogma
% 

%clear;

domainSize = 2;
startDomainSize = 2;
popsize = 10000;
dim = 2;
maxIterations = 100000;
indiv = (randn(popsize,dim)) * 2 * startDomainSize;

eps = 0.001;

stepsize = 0.1;
scaresize = 100;

% Define obstacle
r = 1;
t = linspace(0,2.*pi,60);
xq = cos(t)';
yq = sin(t)';

%% Move
figure(1);
    
for i=1:maxIterations
    % Spread
    indiv = indiv + randn(popsize,dim)*stepsize;
    
    % Avoid
    [in,on] = inpolygon(indiv(:,1),indiv(:,2),xq,yq);
    indiv(in,1) = indiv(in,1)+eps * 10*randn()*scaresize;
    indiv(in,2) = indiv(in,2)+eps * 10*randn()*scaresize;
    
    plot(xq,yq);
    hold on;
    
    plot(indiv(in,1),indiv(in,2),'r+'); % points inside
    plot(indiv(~in,1),indiv(~in,2),'bo'); % points outside
    area = 5;
    axis([-area*domainSize area*domainSize -area*domainSize area*domainSize]);
    hold off;
    
    pause(0.1);
    
end