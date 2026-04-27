# ScrollKnob — Installation

ScrollKnob is a free system that lets you control all the knobs and faders in Mixxx using your keyboard and mouse wheel, without needing a physical controller.

---

## Requirements

Before you begin, download and install the following programs. All of them are **free**.

| Program | Download | Purpose |
|---|---|---|
| **Mixxx 2.5** | [mixxx.org](https://mixxx.org) | DJ software |
| **AutoHotkey v2** | [autohotkey.com](https://www.autohotkey.com) | Converts keyboard and mouse wheel into MIDI signals |
| **LoopMIDI** | [tobias-erichsen.de/software/loopmidi.html](https://www.tobias-erichsen.de/software/loopmidi.html) | Creates a virtual MIDI port so Mixxx can receive the signals |

> ⚠️ Make sure to install **AutoHotkey v2**, not version 1.

---

## ScrollKnob Files

The system includes three files you need to download:

| File | Description |
|---|---|
| `mixxx_control.ahk` | Main script that handles keyboard and mouse wheel input |
| `Custom.kbd.cfg` | Keyboard shortcut configuration for Mixxx |
| `.midi.xml` | MIDI mapping configuration for Mixxx |

---

## Step 1 — Set up LoopMIDI

1. Open **LoopMIDI**
2. In the text field at the bottom, type exactly: `ScrollKnob MIDI`
3. Click the **+** button to create the port
4. **Leave LoopMIDI open** — it must be running whenever you use ScrollKnob

---

## Step 2 — Install the keyboard file in Mixxx

1. Open Windows Explorer
2. Type this path in the address bar and press Enter:
```
%LOCALAPPDATA%\Mixxx
```
3. Copy the `Custom.kbd.cfg` file into that folder
4. If asked to replace an existing file, accept

> ⚠️ The file must be named exactly `Custom.kbd.cfg`. Windows sometimes hides file extensions — verify by going to **View → Options → View → uncheck "Hide extensions for known file types"**.

---

## Step 3 — Install the MIDI configuration file

1. In Windows Explorer, type this path in the address bar and press Enter:
```
%LOCALAPPDATA%\Mixxx\controllers
```
2. Copy the `.midi.xml` file into that folder
3. If asked to replace an existing file, accept

---

## Step 4 — Configure Mixxx

1. Open **Mixxx**
2. Go to **Options → Preferences** (or `Ctrl + P`)
3. In the left panel click **Controllers**
4. Find **ScrollKnob MIDI** in the list
5. In **Load mapping**, click the gear and wrench icon
6. Check that the **Enabled** checkbox is activated
7. Click **Apply** and then **OK**
8. Close and reopen Mixxx so it loads the keyboard file

---

## Step 5 — Run the AutoHotkey script

1. Double-click the `mixxx_control.ahk` file
2. The AutoHotkey icon will appear in the system tray (bottom right corner)
3. If an error message appears about the port, verify that LoopMIDI is running with the `ScrollKnob MIDI` port active

> ✅ The correct startup order is always: **LoopMIDI → mixxx_control.ahk → Mixxx**

---

## Step 6 — Map the knobs in Mixxx *(optional — only if you don't have the `.midi.xml` file)*

This only needs to be done once. Once saved, Mixxx remembers the configuration forever.

1. In Mixxx go to **Options → Preferences → Controllers → ScrollKnob MIDI**
2. Click **Learn**
3. Click a knob in the Mixxx interface, for example the **Left Deck Volume**
4. Hold down the assigned key (in this case `S`) and scroll the mouse wheel
5. Mixxx detects the signal and assigns it
6. Repeat for each knob according to the control table in `USAGE.md`
7. When finished click **Done** to save

> 💡 **Tip:** Before scrolling the wheel, click on the deck's waveform to make sure the focus is on the deck and not on the library.

---

## Recommended mapping order *(only if you complete Step 6)*

| # | Key + wheel | Control in Mixxx |
|---|---|---|
| 1 | `S` + wheel | Left deck volume |
| 2 | `G` + wheel | Right deck volume |
| 3 | `3` + wheel | EQ High left deck |
| 4 | `E` + wheel | EQ Mid left deck |
| 5 | `D` + wheel | EQ Low left deck |
| 6 | `4` + wheel | EQ High right deck |
| 7 | `R` + wheel | EQ Mid right deck |
| 8 | `F` + wheel | EQ Low right deck |
| 9 | `C` + wheel | Filter left deck |
| 10 | `V` + wheel | Filter right deck |
| 11 | `X` + wheel | Crossfader |
| 12 | `A` + wheel | Tempo left deck |
| 13 | `H` + wheel | Tempo right deck |
| 14 | `F1` + wheel | Effect 1 knob left deck |
| 15 | `F2` + wheel | Effect 2 knob left deck |
| 16 | `F3` + wheel | Effect 3 knob left deck |
| 17 | `F4` + wheel | Combined FX volume left deck |
| 18 | `F5` + wheel | Effect 1 knob right deck |
| 19 | `F6` + wheel | Effect 2 knob right deck |
| 20 | `F7` + wheel | Effect 3 knob right deck |
| 21 | `F8` + wheel | Combined FX volume right deck |

---

## Troubleshooting

**ScrollKnob MIDI does not appear in Mixxx**
- Verify that LoopMIDI is running with the port active
- Verify that the AHK script is running (icon in the system tray)
- Close and reopen Mixxx

**The AHK script shows a port error**
- The port name in LoopMIDI must be exactly `ScrollKnob MIDI`
- Check capitalization and spaces

**Keyboard shortcuts (W, T, Q, Y, etc.) are not working**
- Verify that `Custom.kbd.cfg` is in the correct folder
- Verify that the filename is exact, without `.txt` at the end
- Restart Mixxx

**The `.ahk` file disappeared**
- Some antivirus programs like AVG may delete or quarantine `.ahk` files as suspicious
- Open your antivirus → Quarantine → find `mixxx_control.ahk` → Restore and add exception
- If it is not in quarantine, download the file again from the GitHub repository
- To prevent this from happening again, add `mixxx_control.ahk` as an exception in your antivirus settings
