function img = pic(x)
i =2;
F(1:28,1:1) = 1;
while i+28 <= 785;
    A=x(i:i+27);
    A = transpose(A);
    F = [F A];
    i = i + 28;
end
imshow(F);
end