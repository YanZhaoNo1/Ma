clc;clf;clear;
Singular_values = [27 67 135];
Percentage_values = [10 25 50];
IMG = imread("Symmetrical_graphics.jpg");
subplot(2, 2, 1);imshow(IMG);title('原彩色图像');

imgr =double(IMG(:,:,1));
imgg =double(IMG(:,:,2));
imgb =double(IMG(:,:,3));

for i = 1:3
    z=Singular_values(i);
    p = Percentage_values(i);
    for h=1:z
        for l=1:h
            imgr(l,h)=imgr(h,l);
            imgg(l,h)=imgg(h,l);
            imgb(l,h)=imgb(h,l);
        end
    end
    [M, N] = eigs(imgr, z);
    img(:,:,1) = M * N * M';

    [M, N] = eigs(imgg, z);
    img(:,:,2) = M * N * M';
    
    [M, N] = eigs(imgb, z);
    img(:,:,3) = M * N * M';
    
    subplot(2, 2, 1+i);imshow(uint8(img));
    title(['截断前',num2str(p),'%个奇异值重构图像'])
end







