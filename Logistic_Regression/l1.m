clc;
filename = 'training_images.txt';
I = dlmread(filename);
filename1 = 'training_labels.txt';
O = dlmread(filename1);
filename = 'test_images.txt';
P = dlmread(filename);
filename1 = 'test_labels.txt';
R = dlmread(filename1);
[m,n1] = size(I);
[p,q]=size(P);
A(1:m,1:1) = 1;
B(1:p,1:1) = 1;
P = [B P];
I = [A I];
[m,n] = size(I);
alpha = 1;
W(1:10,1:n) = 0;
Y(1:m,1:10) = 0;
for i = 1:m;
    Y(i,O(i)+1) = 1;
end
i = 500;
[cos,des] = cost(m,Y,I,W);
    while i >= 0;
        W = W - alpha*des;
        [tos,dos] = cost(m,Y,I,W);
        if tos == cos;
            break;
        else
            cos = tos;
            des = dos;
        end
        i=i-1;
    end
%Learning___Completed
%disp(W);
    s = sigmoid(W,P);
    h = 0;
    G(1:1,1:p) = 1;
    for j = 1:p;
         [num] = max(s(:,j));
         [f,g] = ind2sub(size(s), find(s==num));
         G(j) = f-1;
         disp(f-1);
         if ((f-1)==R(j));
             h = h + 1;
         end   
    end
    h = (h/p)*100;
    disp(h);
 save('logistic_regu.txt', 'G', '-ascii');
%pic(I(3998,:));