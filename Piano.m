% Set the global variables
global recording record_data fs;
recording = false;
record_data = [];
fs = 44100;

rec_button = uicontrol('Style','pushbutton','Units','normalized','Position',[0.85 0.1 0.1 0.1],'String','Record','Callback',@start_recording);
keys = {'C' 'C#' 'D' 'D#' 'E' 'F' 'F#' 'G' 'G#' 'A' 'A#' 'B'};
f = 440*2.^((0:11)/12); 
wkeys = [1 0 1 0 1 1 0 1 0 1 0 1]; 


fig = figure('Units','normalized','Position',[0.1 0.1 0.8 0.8],'MenuBar','none','ToolBar','none','Name','Piano');
for i = 1:length(keys)
    x = sum(wkeys(1:i-1)) + 1;
    y = 1;
    if ~wkeys(i)
        y = 2;
    end
    uicontrol('Style','pushbutton','Units','normalized','Position',[(x-1)/7 (y-1)/2 1/7 1/2],'String',keys{i},'Callback',{@play_note,f(i)});
end


function play_note(~,~,freq)
    global recording record_data fs;
    duration = 1; 
    t = 0:1/fs:duration;
    y = sin(2*pi*freq*t);
    soundsc(y,fs);
    if recording
        record_data = [record_data y];
    end
end

function start_recording(~,~)
    global recording record_data fs;
    recording = true;
    record_data = [];
    pause(5); 
    recording = false;
    audiowrite('recorded_audio.wav',record_data,fs);
end