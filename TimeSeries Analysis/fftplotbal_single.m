function [pks,locs] = fftplotbal_single(dat,i, name,Sam_freq)
m= size(dat,1);
n= size(dat,2);
%mean = zeros(6,1);
x = linspace(0,(n-1)/Sam_freq,n);
dt = 1/Sam_freq;

col = {'Ax','N','S','Rm','Pm','Ym','Resu'};
ImageFolder ='D:\IITK\Projects\Prof Mittal\New experiment\00_Shuttlecock_Aarush\Write\Time Series\Time Series Write\Plots';

if i == 7
    dat(i,:) = dat(i,:) - mean(dat(i,:));
end

figure()

subplot(1,2,1)
plot(x,dat(i,:));
ylabel("Magnitude")
xlabel("Time")
title(col(i))
%mean(i,1) = mean(dat(i,:));

pbaspect([2 1 1])

subplot(1,2,2)
sig = fft(dat(i,:));
mag = abs(sig);
freq = (0:n-1)*Sam_freq/n;
plot(freq(1:floor(n/2)),mag(1:floor(n/2)))
[pks,locs] = findpeaks(mag(1:floor(n/2)),freq(1:floor(n/2)),'SortStr', 'descend','NPeaks', 10);
%findpeaks(mag(1:floor(n/2)),freq(1:floor(n/2)),'SortStr', 'descend','NPeaks', 10);
%plot(NF_WithSting1(i,1:20000));
title(col(i) + " FFT")
ylabel("Magnitude")
xlabel("Frequency")

pbaspect([2 1 1])
sgtitle(name )
saveas(gca,fullfile(ImageFolder,name + " " + col(i) + " single"),"jpeg")
end



