function [us,vs] = HSoptflow(Xrgb1,Xrgb2)  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% Author: MichaelBeechan
%Time: 2017.4.16
% This MATLAB code shows a Motion Estimation map created by  
% using a Horn and Schunck motion estimation technique on two  
% consecutive frames.  Input requires.  
%     Xrgb(h,w,d,N) where X is a frame sequence of a certain  
%                height(h), width (w), depth (d=3 for color),   
%                and number of frames (N).   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

Xrgb1 = imread('fr9.png');
Xrgb2 = imread('fr10.png');
figure(1);
subplot 121;imshow(rgb2gray(Xrgb1));title('Gray image of the first frame');
subplot 122;imshow(rgb2gray(Xrgb2));title('Gray image of the second frame');
figure(2);
subplot 121;imshow(Xrgb1);title('The first frame');
subplot 122;imshow(Xrgb2);title('The second frame');
%Xrgb1 = PCNN(Xrgb1,15);
%Xrgb2 = PCNN(Xrgb2,15);
figure(3);
subplot 121;imshow(Xrgb1);title('The first frame PCNN');
subplot 122;imshow(Xrgb2);title('The second frame PCNN');
[h,w,d]=size(Xrgb1);  
%get two image frames  
if d==1  
    Xn=double(Xrgb1(:,:,1));  
    Xnp1=double(Xrgb2(:,:,1));  
elseif d==3  
    Xn=double(Xrgb1(:,:,1)*0.299+Xrgb1(:,:,2)*0.587+Xrgb1(:,:,3)*0.114);  
    Xnp1=double(Xrgb2(:,:,1)*0.299+Xrgb2(:,:,2)*0.587+Xrgb2(:,:,3)*0.114);  
else  
    error(2,'not an RGB or Monochrome image file');  
end;  
  
%get image size and adjust for border  
hm5=h-5; wm5=w-5;  
z=zeros(h,w); v1=z; v2=z;  
  
%initialize  
dsx2=v1; dsx1=v1; dst=v1;  
alpha2=625;  
imax=20;  
  
%Calculate gradients  
dst(5:hm5,5:wm5) = ( Xnp1(6:hm5+1,6:wm5+1)-Xn(6:hm5+1,6:wm5+1) + Xnp1(6:hm5+1,5:wm5)-Xn(6:hm5+1,5:wm5)+ Xnp1(5:hm5,6:wm5+1)-Xn(5:hm5,6:wm5+1) +Xnp1(5:hm5,5:wm5)-Xn(5:hm5,5:wm5))/4;  
dsx2(5:hm5,5:wm5) = ( Xnp1(6:hm5+1,6:wm5+1)-Xnp1(5:hm5,6:wm5+1) + Xnp1(6:hm5+1,5:wm5)-Xnp1(5:hm5,5:wm5)+ Xn(6:hm5+1,6:wm5+1)-Xn(5:hm5,6:wm5+1) +Xn(6:hm5+1,5:wm5)-Xn(5:hm5,5:wm5))/4;  
dsx1(5:hm5,5:wm5) = ( Xnp1(6:hm5+1,6:wm5+1)-Xnp1(6:hm5+1,5:wm5) + Xnp1(5:hm5,6:wm5+1)-Xnp1(5:hm5,5:wm5)+ Xn(6:hm5+1,6:wm5+1)-Xn(6:hm5+1,5:wm5) +Xn(5:hm5,6:wm5+1)-Xn(5:hm5,5:wm5))/4;  
  
  
for i=1:imax  
   delta=(dsx1.*v1+dsx2.*v2+dst)./(alpha2+dsx1.^2+dsx2.^2);  
   v1=v1-dsx1.*delta;  
   v2=v2-dsx2.*delta;  
end;  
u=z; u(5:hm5,5:wm5)=v1(5:hm5,5:wm5);  
v=z; v(5:hm5,5:wm5)=v2(5:hm5,5:wm5);  
  
xskip=round(h/32);  
[hs,ws]=size(u(1:xskip:h,1:xskip:w)) ; 
us=zeros(hs,ws); vs=us;  
  
N=xskip^2;  
for i=1:hs-1  
  for j=1:ws-1  
     hk=i*xskip-xskip+1;  
     hl=i*xskip;  
     wk=j*xskip-xskip+1;  
     wl=j*xskip;  
     us(i,j)=sum(sum(u(hk:hl,wk:wl)))/N;  
     vs(i,j)=sum(sum(v(hk:hl,wk:wl)))/N;  
   end;  
end;  
  
figure(4); 
% quiver(us,vs,'k','Linewidth',1,0.5);  
quiver(us,vs,1,'Linewidth',1.5);  
colormap('default');  
axis ij;
%axis([0 44 0 32]);  
% % axis tight;  
% % axis equal;
%axis off;
