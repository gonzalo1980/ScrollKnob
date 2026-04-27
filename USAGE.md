# ScrollKnob — Usage

---

## Before You Start

Every time you use ScrollKnob, open the programs in this order:

1. **LoopMIDI** — verify that the `ScrollKnob MIDI` port is active
2. **mixxx_control.ahk** — double-click to run it, verify the icon in the system tray
3. **Mixxx** — open it last

> ⚠️ If you open Mixxx before LoopMIDI, it will not detect the port and you will need to restart Mixxx.

---

## Control Map

### Keyboard only — single keypress

| Key | Action |
|---|---|
| `W` | Play / Pause left deck |
| `T` | Play / Pause right deck |
| `2` | Cue left deck |
| `5` | Cue right deck |
| `1` | BPM Sync left deck |
| `6` | BPM Sync right deck |
| `Q` | Activate / Deactivate loop left deck |
| `Y` | Activate / Deactivate loop right deck |

### Hold key + mouse wheel

Hold the key down and scroll the mouse wheel to adjust the control.

| Key + wheel | Control |
|---|---|
| `S` + wheel | Left deck volume |
| `G` + wheel | Right deck volume |
| `3` + wheel | EQ High left deck |
| `E` + wheel | EQ Mid left deck |
| `D` + wheel | EQ Low left deck |
| `4` + wheel | EQ High right deck |
| `R` + wheel | EQ Mid right deck |
| `F` + wheel | EQ Low right deck |
| `C` + wheel | Filter left deck |
| `V` + wheel | Filter right deck |
| `X` + wheel | Crossfader |
| `A` + wheel | Tempo left deck |
| `H` + wheel | Tempo right deck |
| `F1` + wheel | Effect 1 knob left deck |
| `F2` + wheel | Effect 2 knob left deck |
| `F3` + wheel | Effect 3 knob left deck |
| `F4` + wheel | Combined FX volume left deck |
| `F5` + wheel | Effect 1 knob right deck |
| `F6` + wheel | Effect 2 knob right deck |
| `F7` + wheel | Effect 3 knob right deck |
| `F8` + wheel | Combined FX volume right deck |

### Special key

| Key | Action |
|---|---|
| `F9` | Enable / Disable ScrollKnob (toggle) |

> 💡 Use `F9` when you need to type in the library search bar or use the keyboard normally without ScrollKnob interfering. Press it again to reactivate.

---

## Cue Behavior

The cue works in CDJ mode, just like professional turntables:

- **Short press** → goes to the cue point and stops
- **Hold down** → plays from the cue point
- **Release** → returns to the cue point
- **Right-click on the waveform** → sets a new cue point

---

## Startup Routine — Important

> ⚠️ **Before every session, test all the knobs.** The system uses Soft Takeover, which means Mixxx and ScrollKnob may have different values when starting up. If you don't sync the knobs before mixing, a control may not respond when you need it most.

### What is Soft Takeover?

When ScrollKnob starts, it does not know what position the knobs are at in Mixxx. Soft Takeover prevents knobs from jumping abruptly to a wrong value — instead, it waits until ScrollKnob's value "catches up" to the actual knob position in Mixxx before taking control.

### How to sync a knob?

If a knob does not respond when you scroll the wheel:

1. Scroll the wheel **upward** a few turns
2. If it still does not respond, scroll **downward** a few turns
3. At some point the knob will "lock in" and start moving — from that point it responds normally

### Recommended startup routine

Before your first mix, go through all controls in this order:

1. `S` + wheel → move left deck volume up and down
2. `G` + wheel → move right deck volume up and down
3. `3`, `E`, `D` + wheel → go through left EQ (High, Mid, Low)
4. `4`, `R`, `F` + wheel → go through right EQ
5. `C` + wheel → move left filter
6. `V` + wheel → move right filter
7. `X` + wheel → move crossfader side to side
8. `F1` to `F4` + wheel → go through left FX
9. `F5` to `F8` + wheel → go through right FX

---

## Changing Effects — Syncing

When you change an effect in Mixxx, its knob starts from 0. ScrollKnob may have a different value saved from the previous effect, causing the knob to not respond immediately.

**Solution:** Scroll the wheel downward until the knob reaches 0 in Mixxx — at that point it will lock in and you can raise it normally without any jumps.

---

## Advantages

- **Free** — no physical controller or paid software required
- **Ergonomic** — left hand on the keyboard, right hand on the mouse
- **Fast** — immediate access to all controls without moving the mouse to each knob
- **Portable** — three files and it's ready on any computer
- **Compatible** — works with any standard keyboard, no special hardware required
- **Silent** — ideal for practicing without equipment

---

## Disadvantages

- **Soft Takeover** — requires syncing knobs at the start of each session and when changing effects
- **No visual feedback** — ScrollKnob does not know the position of each knob in Mixxx, you must rely on the interface
- **Fixed speed** — the wheel speed is the same for all controls (adjustable in the script)
- **Windows only** — the AutoHotkey script only works on Windows
- **Antivirus** — some antivirus programs like AVG may delete the `.ahk` file (see troubleshooting in `INSTALLATION.md`)
- **Three programs required** — LoopMIDI, AutoHotkey and Mixxx must all be open at the same time

---

## Adjusting the Wheel Speed

If the wheel moves too fast or too slow, you can adjust it by editing `mixxx_control.ahk` with Notepad. Find this line at the top:

```
STEP := 5
```

- `STEP := 3` → slow wheel, more precise
- `STEP := 5` → normal speed
- `STEP := 8` → fast wheel, less precise

Save the file and run it again to apply the change.
