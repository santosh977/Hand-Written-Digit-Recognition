function img = pic(x)
i =2;
F(1:28,1:1) = 1;
while i+28 <= 785;
    disp(i);
    A=x(i:i+27);
    A = transpose(A);
    [m,n] = size(A);
disp(m);
disp(n);
    F = [F A];
    i = i + 28;
end
imshow(F);
end