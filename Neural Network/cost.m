function [J, W1_grad, W2_grad] = cost(m,Y,I,W1,W2)
lambda = 0;  
   a1 = (I)';
   z2 = W1 * a1; 
   D = ones(1,m);
   a2 = [D; sigmoid(z2)];
   z3 = W2 * a2;
   a3 = sigmoid(z3);
   h_theta_x = (a3)';
   
    y_i = (Y)';
    j1 = -y_i*log(h_theta_x);
    j2 = (1-y_i)*log(1-h_theta_x);
    cost = (j1 - j2);


unreg_component = (1/m)*(cost);

reg_W1 = sum(sum((W1(2:end,:)).^2));
reg_W2 = sum(sum((W2(2:end,:)).^2));
reg_component = (lambda/(2*m))*(reg_W1 + reg_W2);
J = unreg_component + reg_component;


Big_delta_1 = 0;
Big_delta_2 = 0;
    

    a1 = (I)';
    z2 = W1 * a1;
    P = ones(1,m);
    a2 = [P; sigmoid(z2)];
    z3 = W2 * a2;
    a3 = sigmoid(z3);

    delta3 = a3 - (Y)';

    intermed1 = ((W2')*delta3);
    intermed1 = intermed1(2:21,1:m);
    delta2 = intermed1.*sigmoidGradient(z2);
    
    Big_delta_1 = Big_delta_1 + delta2*(a1');
    Big_delta_2 = Big_delta_2 + delta3*(a2');


unreg_W1_grad = (1/m)*Big_delta_1;
unreg_W2_grad = (1/m)*Big_delta_2;

L1 = unreg_W1_grad(:,2:end) + (lambda/m)*W1(:,2:end);
W1_grad = [unreg_W1_grad(:,1) L1];

L2 = unreg_W2_grad(:,2:end) + (lambda/m)*W2(:,2:end);
W2_grad = [unreg_W2_grad(:,1) L2];

end
