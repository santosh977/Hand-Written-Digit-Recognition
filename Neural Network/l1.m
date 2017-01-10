clc;
disp('s1234');
filename = 'training_images.txt';
I = dlmread(filename);
filename1 = 'training_labels.txt';
O = dlmread(filename1);
filename = 'test_images.txt';
P = dlmread(filename);
filename1 = 'test_labels.txt';
R = dlmread(filename1);
[m,n1] = size(I);
A(1:m,1:1) = 1;
B(1:1000,1:1) = 1;
P = [B P];
I = [A I];
[m,n] = size(I);
alpha = 1;
h = 20;
W1 = zeros(h,n);
epsilon_init = 0.086;
W1 = rand(h,n) * 2 * epsilon_init - epsilon_init;
W2 = zeros(10,h+1);
W2 = rand(10,h+1) * 2 * epsilon_init - epsilon_init;
Y(1:m,1:10) = 0;
for i = 1:m;
    Y(i,O(i)+1) = 1;
end
i = 1000;
[cos,des1,des2] = cost(m,Y,I,W1,W2);
    while i >= 0;
        W1 = W1 - alpha.*des1;
        W2 = W2 - alpha.*des2;
        
        [tos,dos1,dos2] = cost(m,Y,I,W1,W2);
        %disp('tos');
        %disp(diag(tos));
        if tos == cos;
            break;
        else
            cos = tos;
            des1 = dos1;
            des2 = dos2;
        end
        i=i-1;
    end
    z2 = W1 * P';
    D = ones(1,1000);
    a2 = [D ; sigmoid(z2)];
    z3 = W2*a2;
    s = sigmoid(z3);
    h = 0;
    G(1:1,1:p) = 1;
    for j = 1:1000;
         [num] = max(s(:,j));
         [f,g] = ind2sub(size(s), find(s==num));
         if ((f-1)==R(j));
             h = h + 1;
         end
         G(j) = f-1; 
    end
    h = (h/1000)*100;
    disp(h);
 save('neural_unregu.txt', 'G', '-ascii');
%pic(I(77,:));