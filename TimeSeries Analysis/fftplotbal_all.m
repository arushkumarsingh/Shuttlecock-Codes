function [peak_cell] = fftplotbal_all(dat, col, name, k, Sam_freq, peak_cell )
m= size(dat,1);
n= size(dat,2);
mean = zeros(7,1);
x = linspace(0,(n-1)/Sam_freq,n);
dt = 1/Sam_freq;

col3 = {'10','20','30','40','50','60','70'}; 
name = name + " " + col3(k);
ImageFolder ='D:\IITK\Projects\Prof Mittal\New experiment\00_Shuttlecock_Aarush\Write\Time Series\Time Series Write\Plots';
figure()
tiledlayout(3,3,'TileSpacing','Compact','Padding','Compact');
for i = 1:7
    nexttile
    %subplot(3,3,i)
    plot(x,dat(i,:));
    ylabel(col(i))
    xlabel("Time")
    %title(col(i))
    %mean(i,1) = mean(dat(i,:));
    %pbaspect([3 1.5 1])
    
end

sgtitle(name + " Time series")
layoutWidth = 1000;   % Desired width in pixels
layoutHeight = 600;
set(gcf, 'Position', [100, 100, layoutWidth, layoutHeight]);
saveas(gca,fullfile(ImageFolder,name + " Time series all"),"jpeg")
figure()
tiledlayout(3,3,'TileSpacing','Compact','Padding','Compact');
for i = 1:7
    %subplot(3,3,i)
    sig = fft(dat(i,:));
    mag = abs(sig);
    freq = (0:n-1)*Sam_freq/n;
    nexttile
    plot(freq(1:floor(n/2)),mag(1:floor(n/2)))
    [peak_cell{i + (k-1)*7,1} , peak_cell{i + (k-1)*7,2}] = findpeaks(mag(1:floor(n/2)),freq(1:floor(n/2)),'SortStr', 'descend','NPeaks', 10);
   % pbaspect([3 1.5 1])
    %plot(NF_WithSting1(i,1:20000));
   % title(col(i))
    ylabel(col(i))
    xlabel("Frequency")
    %tightfig;
end
%pbaspect([2 1 1])
sgtitle(name + " FFT")
layoutWidth = 1000;   % Desired width in pixels
layoutHeight = 600;
set(gcf, 'Position', [100, 100, layoutWidth, layoutHeight]);
saveas(gca,fullfile(ImageFolder,name + " FFT all"),"jpeg")
end

    



