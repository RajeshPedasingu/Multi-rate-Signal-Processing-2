clc;
clear all;
close all;

fs=80;
n=0:1/fs:2999-(1/fs);
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


%  decimation followed by inter polation 


%interpolation (up sampling)

x1=upsample(x,3);
fs1=fs*3;
disp("sampling frequency after up sampling(in Hz)= "+ num2str(fs1))
x_u=fftshift(fft(x1));
N1=length(x_u);
k1=(fs1/N1)*(-N1/2:N1/2-1);


figure;
subplot(2,1,1)
plot(x1)
title('x_n up sampled by 3 (x_u)')
xlabel('time sample')
ylabel('amplitude')
xlim([0 50])
subplot(2,1,2)
plot(k1,abs(x_u))
title('spectrum of up sampled signal ')
xlabel('frequency (Hz)')
ylabel('amplitude')





% --filter in f- domain 

wc=(26/fs1)*2;
%T1=length(x2);
T1=100;
h1=fir1(T1-1,wc,'low');
den=[1];
%x3=conv(h1,x2);
x3=filter(h1,den,x1);

x4=fftshift(fft(x3));
N2=length(x4);
k2=(fs/N2)*(-N2/2:N2/2-1);

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




% decimation (down samling) by 

fs2= fs1/2;
x2=downsample(x3,2);
disp("sampling frequency after down sampling(in Hz)= "+ num2str(fs2))
x_d=fftshift(fft(x2));
N1=length(x_d);
k1=(fs2/N1)*(-N1/2:N1/2-1);

figure;
subplot(2,1,1)
plot(x2)
title('x_n up sampled by 2 (x_d)')
xlabel('time sample')
ylabel('amplitude')
xlim([0 50])
subplot(2,1,2)
plot(k1,abs(x_d))
title('spectrum of down sampled signal ')
xlabel('frequency (Hz)')
ylabel('amplitude')


























































% % using resample function
% fs1=80*(3/2);
% 
% x2=resample(x,3,2);
% 
% 
% 
% xi=fftshift(fft(x));
% N1=length(xi);
% k11=(fs1/N1)*(-N1/2:N1/2-1);
% 
% figure;
% subplot(2,1,1)
% plot(x)
% xlim([0 50])
% title('input signal x(n)')
% subplot(2,1,2)
% plot(k11,abs(xi))
% title('spectrum of x(n)')








