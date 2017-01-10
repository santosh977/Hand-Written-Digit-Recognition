function s = sigmoid(w,x)
z = w*transpose(x);
%disp(z);
s = (1 + exp(-z)).^(-1);
%disp(s);
end