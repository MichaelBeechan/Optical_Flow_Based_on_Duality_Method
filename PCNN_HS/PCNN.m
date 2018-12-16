function Y = PCNN(img,N);
img = rgb2gray(img); 
%g = i;
%g = g(:,:,2);
[m,n] = size (img); 
X = im2double(img); 
%G2=[-1 -1 -1;-1 8 -1;-1 -1 1]; 
%************************************************************ 
% Initialize PCNN Parameters 
%************************************************************ 
% P £ºL E F VF VL VE beta 
% V: 1.0 1.0 0.1 0.5 0.2 20 0.1 
al = 1.0; ae = 1.0; af = 0.1; vf = 0.5; vl = 0.2; ve = 20; B = 0.1; 
W =[0.5 1 0.5;... 
     1  0  1;...
    0.5 1 0.5]; 
M = W; Y = zeros(m,n); F = Y; L = Y; U = Y; E = Y; 
%************************************************************ 
% PCNN µã»ð¹ý³Ì 
%************************************************************ 
for i = 1 : N
    wk = conv2(Y,M,'same');
    F = exp(-af).* F + vf.* wk + X; 
    L = exp(-al).* L + vl.* wk; 
    U = F.*(1 + B.* L); 
    Y = double(U>E); 
    E = exp(-ae).* E + ve.* Y; 
end
%{
F2 = double(Y);        
U = double(Y);       
uSobel = Y;
for i = 2:m - 1   %sobel±ßÔµ¼ì²â
    for j = 2:n - 1
        Gx = (U(i+1,j-1) + 2*U(i+1,j) + F2(i+1,j+1)) - (U(i-1,j-1) + 2*U(i-1,j) + F2(i-1,j+1));
        Gy = (U(i-1,j+1) + 2*U(i,j+1) + F2(i+1,j+1)) - (U(i-1,j-1) + 2*U(i,j-1) + F2(i+1,j-1));
        uSobel(i,j) = sqrt(Gx^2 + Gy^2); 
    end
end
Y = uSobel;
%}
%{
I2 = zeros(m,n);
for i=2:m-1  
    for j=2:n-1  
        for k=-1:1  
           for p=-1:1  
               I2(i,j)=I2(i,j)+Y(i+k,j+p)*G2(k+2,p+2);  
           end  
       end  
    end  
end  
Y = I2;
%}

