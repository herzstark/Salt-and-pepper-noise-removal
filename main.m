clear, clc;
Noisy=imread('NoisyImage.png');
imshow(Noisy);
subplot(1,2,1),imshow(Noisy),title('Before');
noNoise=uint8(zeros(size(Noisy,1),size(Noisy,2)));
arra=zeros(1,9);
row=size(Noisy,1);
col=size(Noisy,2);
padded=uint8(zeros(row+2,col+2)); 
padded(2:row+1,2:col+1)= Noisy;%%with padding now I have zeros around my image
%%I am using 3*3 filter So I am gonna check all 9 pixel and put the median
%%into its middle (2,2)
for i=2:1:row+1
    for j=2:1:col+1
        arra(1,1)= padded(i-1,j-1);
        arra(1,2)= padded(i,j-1);
        arra(1,3)= padded(i+1,j-1);
        arra(1,4)= padded(i-1,j);
        arra(1,5)= padded(i,j);
        arra(1,6)= padded(i+1,j);
        arra(1,7)= padded(i-1,j+1);
        arra(1,8)= padded(i,j+1);
        arra(1,9)= padded(i+1,j+1);
        %%now they are all in my array
        newarra=sort(arra,'ascend'); %%they are sorted now
        noNoise(i-1,j-1)= newarra(5); %found the median and put it to my new picture
        
        
    end
end
subplot(1,2,2),imshow(noNoise),title('After');
imwrite(noNoise,'EnhancedImage.png');
