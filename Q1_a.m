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




%upsampling

x2=upsample(x,5);

xi=(fft(x2));
N1=length(xi);
k1=(fs/N1)*(0:N1-1);

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



%lowpass filter

fs1=fs*5;
wc=(12/fs1)*2; %cut off frequency =12 radians/sec
N1=100;
h1=fir1(N1-1,wc,'low');
den=[1];
x3=filter(h1,den,x2);
y3=fft(x3);

n3=0:length(y3)-1;
k4=(fs1/length(n3))*n3;

figure;
subplot(2,1,1)
plot(x3)
title('after passing through low pass filter')
xlabel('time sample')
ylabel('amplitude')
xlim([0 100])
subplot(2,1,2)
plot(k4,abs(y3))
title('spectrum after low pass filter')
xlabel('frequency (Hz)')
ylabel('amplitude')
%ylim([0 5000])

%down sampling
x_d=downsample(x3,4);
fs2=fs1/4;

y4=fft(x_d);
n4=0:length(y4)-1;
k5=(fs2/length(n4))*n4;

figure;
subplot(2,1,1)
plot(x_d)
title('down sampled signal x_d ')
xlabel('time sample')
ylabel('amplitude')
xlim([0 200])
subplot(2,1,2)
plot(k5,abs(y4))
title('spectrum of down sampled signal')
xlabel('frequency (Hz)')
ylabel('amplitude')








