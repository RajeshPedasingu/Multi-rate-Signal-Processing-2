clc;
clear all;
close all;

fs=20;
n=0:1/fs:2999;
x=cos(10*pi*n)+cos(20*pi*n);

xi=(fft(x));
N1=length(xi);
k1=(fs/N1)*(0:N1-1);
figure;
subplot(2,1,1)
plot(x)
xlim([0 50])
title('input signal x(n)')
xlabel('time sample')
ylabel('amplitude')
subplot(2,1,2)
plot(k1,abs(xi))
title('spectrum of x(n)')
xlabel('frequency (Hz)')
ylabel('amplitude')


x_d=downsample(x,4);
fs1=fs/4;

wc=0.25;
N1=100;
h1=fir1(N1-1,wc,'low');
den=[1];
xl=filter(h1,den,x_d);

x2=upsample(x_d,5);



xi=(fft(x2));
N1=length(xi);
k1=(25/N1)*(0:N1-1);


figure;
subplot(2,1,1)
plot(x2)
title('x_n up sampled by 5 x_up')
xlabel('time sample')
ylabel('amplitude')
xlim([0 50])
subplot(2,1,2)
plot(k1,abs(xi))
title('spectrum of upsampled signal ')
xlabel('frequency (Hz)')
ylabel('amplitude')






