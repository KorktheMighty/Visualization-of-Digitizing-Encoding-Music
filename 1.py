import tkinter as tk

class MusicEncoder:
    def __init__(self, master):
        self.master = master
        master.title("Music Encoder")


        self.label1 = tk.Label(master, text="Analog Music Signal")
        self.label2 = tk.Label(master, text="Digital Music Signal")
        self.canvas1 = tk.Canvas(master, width=400, height=200, bg="white")
        self.canvas2 = tk.Canvas(master, width=400, height=200, bg="white")
        self.button = tk.Button(master, text="Encode Music", command=self.encode_music)
        self.label1.pack()
        self.canvas1.pack()
        self.label2.pack()
        self.canvas2.pack()
        self.button.pack()

    def encode_music(self):
        # Simulate digitization and encoding of music
        analog_signal = [0.2, 0.5, 0.8, 0.7, 0.1, -0.2, -0.5, -0.8, -0.7, -0.1]
        digital_signal = [round(x * 255) + 128 for x in analog_signal]
        self.canvas1.delete("all")
        self.canvas2.delete("all")
        for i in range(len(analog_signal)):
            x1 = i * 40 + 20
            y1 = 100 - analog_signal[i] * 50
            x2 = (i + 1) * 40 + 20
            y2 = 100 - analog_signal[i] * 50
            self.canvas1.create_line(x1, y1, x2, y2, fill="blue")
        for i in range(len(digital_signal)):
            x1 = i * 40 + 20
            y1 = 100 - digital_signal[i] / 2
            x2 = (i + 1) * 40 + 20
            y2 = 100 - digital_signal[i] / 2
            self.canvas2.create_line(x1, y1, x2, y2, fill="red")


root = tk.Tk()
app = MusicEncoder(root)
root.mainloop()
