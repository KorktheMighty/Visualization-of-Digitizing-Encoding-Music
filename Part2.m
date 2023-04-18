fs = 44100;
duration = 0.5; 

% generate 10 random tones
num_tones = 10;
tones = randi([1 12], 1, num_tones); 
frequencies = 440 * 2.^((tones-1)/12); 
time = 0:1/fs:duration-1/fs;
song = [];
for i = 1:num_tones
    tone = sin(2*pi*frequencies(i)*time);
    song = [song tone];
end

% calculate the Fourier transform of the song
N = length(song);
f = (0:N-1)*fs/N;
song_fft = fft(song)/N;
filename = 'random_song.wav';
audiowrite(filename, song, fs);
disp(['Song saved as ' filename]);


figure;
subplot(2,2,1);
plot(song);
xlabel('Sample Index');
ylabel('Amplitude');
title('Waveform');
subplot(2,2,2);
spectrogram(song, 256, 250, [], fs, 'yaxis');
title('Spectrogram');
subplot(2,2,[3,4]);
plot(f, abs(song_fft));
xlim([0 fs/2]);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Fourier Transform');
hold on;
nyquist = plot([fs/2 fs/2], [0 max(abs(song_fft))], 'r--');
legend(nyquist, 'Nyquist Frequency');