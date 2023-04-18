fs = 44100;
duration = 5;
t = 0:1/fs:duration-1/fs;
f0 = 1000;
signal = sin(2*pi*f0*t) + 0.5*randn(size(t));

IR = audioread('recorded_audio.wav');
room_signal = conv(signal, IR);
room_signal = room_signal(1:length(signal));

%For db Math
rms_signal = rms(signal);
rms_room_signal = rms(room_signal);
loss = 20*log10(rms_room_signal/rms_signal); 
disp(['Signal loss: ' num2str(loss) ' dB']); 

figure;
subplot(2,1,1);
plot(t, signal);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(2,1,2);
plot(t, room_signal);
title('Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');