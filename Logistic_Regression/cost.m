function [c,d] = cost(m,Y,I,w)
lambda=1;
s = sigmoid(w,I);
e = -log(s)*Y - log(1-s)*(1-Y);
sum1(1:10,1:1)=1;
for i=1:10
    row=w(i,:);
    sum1(i,1)=row*transpose(row);
end
Quad_regularisation=(lambda/m)*w;
c = (1/m)*e;
c = diag(c)+(lambda/(2*m))*sum1;
g = (s - transpose(Y))*I;
d = g.*(1/m)+Quad_regularisation;
end