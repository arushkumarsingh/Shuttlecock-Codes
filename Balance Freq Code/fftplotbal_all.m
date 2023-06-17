function [mean] = fftplotbal_all(dat, col, name,ImageFolder)
m= size(dat,1);
n= size(dat,2);
mean = zeros(7,1);
Sam_freq = 1000;
x = linspace(0,(n-1)/Sam_freq,n);
dt = 1/Sam_freq;



figure()
for i = 1:7
    subplot(4,2,i)
    plot(x,dat(i,:));
    ylabel(col(i))
    xlabel("Time")
    %title(col(i))
    %mean(i,1) = mean(dat(i,:));

    
end
sgtitle(name + " Time series")
saveas(gca,fullfile(ImageFolder,name + " Time series all"),"jpeg")
figure()

for i = 1:7
    subplot(4,2,i)
    sig = fft(dat(i,:));
    mag = abs(sig);
    freq = (0:n-1)*Sam_freq/n;
    plot(freq,mag)

    %plot(NF_WithSting1(i,1:20000));
   % title(col(i))
    ylabel(col(i))
    xlabel("Frequency")
end
sgtitle(name + " FFT")
saveas(gca,fullfile(ImageFolder,name + " FFT all"),"jpeg")
end

    



