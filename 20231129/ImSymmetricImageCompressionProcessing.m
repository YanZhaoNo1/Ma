clc;clf;clear;
IMG=imread('Matlab.jpg') ;
img =IMG;
Singular_values = [19 48 96];
Percentage_values = [10 25 50];
subplot(2,2,1),
imshow(img),title('原彩色图像')

imgr =double(IMG(:,:,1));
imgg =double(IMG(:,:,2));
imgb =double(IMG(:,:,3));

for i=1:3
    s = Singular_values(i);
    p = Percentage_values(i);
    [U,S,V]=svds (imgr,s);
    img(:,:,1)=U*S*V';
    [U,S,V]=svds (imgg,s);
    img(:,:,2)=U*S*V';
    [U,S,V]=svds (imgb,s);
    img(:,:,3)=U*S*V';
    subplot(2,2,i+1),imshow(uint8(img))
    title(['截断前',num2str(p),'%个奇异值重构图像'])
end