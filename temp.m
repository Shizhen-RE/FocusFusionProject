t1 = imread('outputImg/final/c_01.tif');
t2 = imread('outputImg/final/c_02.tif');
t3 = imread('outputImg/final/c_03.tif');
t4 = imread('outputImg/final/c_04.tif');
t5 = imread('outputImg/final/c_05.tif');

d11 = imread('outputImg/final/d_1_01.tif');
d12 = imread('outputImg/final/d_1_02.tif');
d13 = imread('outputImg/final/d_1_03.tif');
d14 = imread('outputImg/final/d_1_04.tif');
d15 = imread('outputImg/final/d_1_05.tif');
d31 = imread('outputImg/final/d_3_01.tif');
d32 = imread('outputImg/final/d_3_02.tif');
d33 = imread('outputImg/final/d_3_03.tif');
d34 = imread('outputImg/final/d_3_04.tif');
d35 = imread('outputImg/final/d_3_05.tif');
d51 = imread('outputImg/final/d_5_01.tif');
d52 = imread('outputImg/final/d_5_02.tif');
d53 = imread('outputImg/final/d_5_03.tif');
d54 = imread('outputImg/final/d_5_04.tif');
d55 = imread('outputImg/final/d_5_05.tif');
d71 = imread('outputImg/final/d_7_01.tif');
d72 = imread('outputImg/final/d_7_02.tif');
d73 = imread('outputImg/final/d_7_03.tif');
d74 = imread('outputImg/final/d_7_04.tif');
d75 = imread('outputImg/final/d_7_05.tif');

psnr1 = (psnr(d11, t1)+psnr(d12, t2)+psnr(d13, t3)+psnr(d14, t4)+psnr(d15, t5))/5;
psnr3 = (psnr(d31, t1)+psnr(d32, t2)+psnr(d33, t3)+psnr(d34, t4)+psnr(d35, t5))/5;
psnr5 = (psnr(d51, t1)+psnr(d52, t2)+psnr(d53, t3)+psnr(d54, t4)+psnr(d55, t5))/5;
psnr7 = (psnr(d71, t1)+psnr(d72, t2)+psnr(d73, t3)+psnr(d74, t4)+psnr(d75, t5))/5;

mse1 = (immse(d11, t1)+immse(d12, t2)+immse(d13, t3)+immse(d14, t4)+immse(d15, t5))/5;
mse3 = (immse(d31, t1)+immse(d32, t2)+immse(d33, t3)+immse(d34, t4)+immse(d35, t5))/5;
mse5 = (immse(d51, t1)+immse(d52, t2)+immse(d53, t3)+immse(d54, t4)+immse(d55, t5))/5;
mse7 = (immse(d71, t1)+immse(d72, t2)+immse(d73, t3)+immse(d74, t4)+immse(d75, t5))/5;

x = [1 3 5 7];
psnrarr = [psnr1 psnr3 psnr5 psnr7];
msearr = [mse1 mse3 mse5 mse7];

tiledlayout(1, 2);
nexttile;
plot(x, psnrarr);
xlabel("noise level");
ylabel("PSNR");
xlim([0, 8]);
nexttile;
plot(x, msearr / 256);
xlabel("noise level");
ylabel("MSE");
xlim([0, 8]);
