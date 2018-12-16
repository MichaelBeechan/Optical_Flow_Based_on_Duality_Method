%读取PCM原始光流场文件并显示，大小200*200
function [ou,ov]=rpcm(m,n)
%[fname, pathname] = uigetfile('flow10.pcm', 'Pick the pcm file');
%fandpname=strcat(pathname,fname);
%pid=fopen(fandpname);
m = 200;
n = 200;
pid=fopen('C:\Users\Administrator\Desktop\H_s\flow10.bin');
A=fread(pid,1,'char');
char(A)
utemp=fread(pid,m*n*2,'float');
fclose(pid);
ou=zeros(m,n);
ov=zeros(m,n);
k=1;
for i=1:m
    for j=1:n
        if k<=m*n*2
          ou(i,j)=utemp(k);
          k=k+1;
          ov(i,j)=utemp(k);
          k=k+1;
        end
    end
end
%quiver(ou,ov)
figure,quiver(ou(m:-4:1,1:4:n),-ov(m:-4:1,1:4:n))
title('真实光流场');