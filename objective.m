function [ y ] = objective( x )
%OBJECTIVE Returns from a selection of objective functions

y = sin(x(:,1)*x(:,2));

end

