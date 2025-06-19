#!/usr/bin/env python
import Tkinter as tk

class StatusLights:
    def __init__(self, master):
        self.green_light = tk.Label(master, text="Wacht op start", bg="gray", width=15, height=2)
        self.green_light.pack(pady=2)

        self.orange_light = tk.Label(master, text="In bedrijf", bg="gray", width=15, height=2)
        self.orange_light.pack(pady=2)

        self.red_light = tk.Label(master, text="Fout", bg="gray", width=15, height=2)
        self.red_light.pack(pady=2)

        self.blue_light = tk.Label(master, text="Homing", bg="gray", width=15, height=2)
        self.blue_light.pack(pady=2)

    def set_all(self, color):
        self.green_light.config(bg=color)
        self.orange_light.config(bg=color)
        self.red_light.config(bg=color)
        self.blue_light.config(bg=color)

    def set_status(self, status):
        self.set_all("gray")
        if status == "wacht_op_start":
            self.green_light.config(bg="green")
        elif status == "in_bedrijf":
            self.orange_light.config(bg="orange")
        elif status == "storing":
            self.green_light.config(bg="green")
            self.orange_light.config(bg="orange")
        elif status == "fout":
            self.red_light.config(bg="red")
        elif status == "homing":
            self.blue_light.config(bg="blue")
