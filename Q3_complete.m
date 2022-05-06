clc;
clear all;
close all;

fs=80;
n=0:1/fs:2999;
x=sin(20*pi*n)+sin(50*pi*n);

xi=fftshift(fft(x));
N1=length(xi);
k11=(fs/N1)*(-N1/2:N1/2-1);

figure;
subplot(2,1,1)
plot(x)
xlim([0 50])
title('input signal x(n)')
xlabel('time sample')
ylabel('amplitude')
subplot(2,1,2)
plot(k11,abs(xi))
title('spectrum of x(n)')
xlabel('frequency (Hz)')
ylabel('amplitude')


%upsampling;

x2=upsample(x,2);
fs1=fs*2;
disp("sampling frequency after up sampling(in Hz)= "+ num2str(fs1))
x_u=fftshift(fft(x2));
N1=length(x_u);
k1=(fs1/N1)*(-N1/2:N1/2-1);

figure;
subplot(2,2,1)
plot(x)
xlim([0 50])
title('input signal x(n)')
xlabel('time sample')
ylabel('amplitude')

subplot(2,2,2)
plot(x2)
title('x_n up sampled by 2 (x_up)')
xlabel('time sample')
ylabel('amplitude')
xlim([0 50])


subplot(2,2,3)
plot(k11,abs(xi))
title('spectrum of x(n)')
xlabel('frequency (Hz)')
ylabel('amplitude')


subplot(2,2,4)
plot(k1,abs(x_u))
title('spectrum of upsampled signal ')
xlabel('frequency (Hz)')
ylabel('amplitude')












% --filter in f- domain
wc=(25/fs1)*2;
T1=length(x2);
h1=fir1(T1-1,wc,'low');
den=[1];
x3=conv(h1,x2);

x4=fftshift(fft(x3));
N2=length(x4);
k2=(fs1/N2)*(-N2/2:N2/2-1);

figure;
subplot(2,1,1)
plot(x3)
title('low pass filter output ')
xlabel('time sample')
ylabel('amplitude')

xlim([0 50])
subplot(2,1,2)
plot(k2,abs(x4))
title('spectrum of lowpass filter output ')
xlabel('frequency (Hz)')
ylabel('amplitude')



