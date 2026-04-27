#Requires AutoHotkey v2.0
#HotIf

; =============================================
; CONFIGURACIÓN
; Cambia STEP para ajustar la velocidad de la rueda
; 3 = lento, 5 = normal, 8 = rápido
; =============================================
MIDI_PORT_NAME := "ScrollKnob MIDI"
MIDI_CHANNEL   := 1
STEP           := 8

; Valores actuales de cada parámetro (0-127)
; 64 = centro, 80 = levemente arriba del centro
global vals := Map(
    "vol1",      80,
    "vol2",      80,
    "eq_hi1",    64,
    "eq_mi1",    64,
    "eq_lo1",    64,
    "eq_hi2",    64,
    "eq_mi2",    64,
    "eq_lo2",    64,
    "fil1",      64,
    "fil2",      64,
    "fx1_izq",   64,
    "fx2_izq",   64,
    "fx3_izq",   64,
    "fxvol_izq", 64,
    "fx1_der",   64,
    "fx2_der",   64,
    "fx3_der",   64,
    "fxvol_der", 64,
    "xfader",    64,
    "tempo1",    64,
    "tempo2",    64
)

; Números de CC MIDI para cada parámetro
; Estos deben coincidir con lo que asignes en Mixxx
global cc := Map(
    "vol1",      1,
    "vol2",      2,
    "eq_hi1",    3,
    "eq_mi1",    4,
    "eq_lo1",    5,
    "eq_hi2",    6,
    "eq_mi2",    7,
    "eq_lo2",    8,
    "fil1",      9,
    "fil2",      10,
    "fx1_izq",   11,
    "fx2_izq",   12,
    "fx3_izq",   13,
    "fxvol_izq", 14,
    "fx1_der",   15,
    "fx2_der",   16,
    "fx3_der",   17,
    "fxvol_der", 18,
    "xfader",    19,
    "tempo1",    20,
    "tempo2",    21
)

; =============================================
; ABRIR PUERTO MIDI (LoopMIDI)
; =============================================
global hMidi := 0
OpenMidi()

OpenMidi() {
    global hMidi, MIDI_PORT_NAME
    numDevs := DllCall("winmm.dll\midiOutGetNumDevs")
    Loop numDevs {
        devID := A_Index - 1
        MIDIOUTCAPS := Buffer(132)
        DllCall("winmm.dll\midiOutGetDevCapsW", "UInt", devID, "Ptr", MIDIOUTCAPS, "UInt", 132)
        name := StrGet(MIDIOUTCAPS.Ptr + 8, 32, "UTF-16")
        if InStr(name, MIDI_PORT_NAME) {
            DllCall("winmm.dll\midiOutOpen", "UInt*", &hMidi, "UInt", devID, "UInt", 0, "UInt", 0, "UInt", 0)
            
            ; Enviar todos los valores iniciales a Mixxx al arrancar
            Sleep 500
            for param, val in vals
                SendCC(cc[param], val)
            
            return
        }
    }
    MsgBox "Puerto '" MIDI_PORT_NAME "' no encontrado.`n¿Está LoopMIDI corriendo con ese nombre?"
}

SendCC(ccNum, value) {
    global hMidi, MIDI_CHANNEL
    value := Max(0, Min(127, value))
    msg := 0xB0 | (MIDI_CHANNEL - 1)
    DllCall("winmm.dll\midiOutShortMsg", "UInt", hMidi, "UInt", msg | (ccNum << 8) | (value << 16))
}

Adjust(param, delta) {
    global vals, cc, STEP
    vals[param] := Max(0, Min(127, vals[param] + delta * STEP))
    SendCC(cc[param], vals[param])
}

; =============================================
; TECLAS QUE PASAN DIRECTO A MIXXX
; El ~ hace que AHK no las intercepte
; =============================================
~w::return
~t::return
~q::return
~y::return
~1::return
~2::return
~5::return
~6::return

; =============================================
; F9 = TOGGLE ON/OFF DEL SCRIPT
; Funciona siempre, incluso dentro de Mixxx
; =============================================
#SuspendExempt true
F9::
{
    static suspendido := false
    suspendido := !suspendido
    if suspendido {
        Suspend true
        TrayTip "Mixxx Control", "⏸ Shortcuts DESACTIVADOS", 1
    } else {
        Suspend false
        TrayTip "Mixxx Control", "▶ Shortcuts ACTIVADOS", 1
    }
}
#SuspendExempt false

; =============================================
; CONTROLES CON TECLA MANTENIDA + RUEDA DEL MOUSE
; =============================================

; --- EQ HIGH ---
; 3 = EQ High deck izquierdo
#HotIf GetKeyState("3", "P")
WheelUp::   Adjust("eq_hi1", +1)
WheelDown:: Adjust("eq_hi1", -1)
#HotIf

; 4 = EQ High deck derecho
#HotIf GetKeyState("4", "P")
WheelUp::   Adjust("eq_hi2", +1)
WheelDown:: Adjust("eq_hi2", -1)
#HotIf

; --- EQ MID ---
; E = EQ Mid deck izquierdo
#HotIf GetKeyState("e", "P")
WheelUp::   Adjust("eq_mi1", +1)
WheelDown:: Adjust("eq_mi1", -1)
#HotIf

; R = EQ Mid deck derecho
#HotIf GetKeyState("r", "P")
WheelUp::   Adjust("eq_mi2", +1)
WheelDown:: Adjust("eq_mi2", -1)
#HotIf

; --- EQ LOW ---
; D = EQ Low deck izquierdo
#HotIf GetKeyState("d", "P")
WheelUp::   Adjust("eq_lo1", +1)
WheelDown:: Adjust("eq_lo1", -1)
#HotIf

; F = EQ Low deck derecho
#HotIf GetKeyState("f", "P")
WheelUp::   Adjust("eq_lo2", +1)
WheelDown:: Adjust("eq_lo2", -1)
#HotIf

; --- VOLUMEN ---
; S = Volumen deck izquierdo
#HotIf GetKeyState("s", "P")
WheelUp::   Adjust("vol1", +1)
WheelDown:: Adjust("vol1", -1)
#HotIf

; G = Volumen deck derecho
#HotIf GetKeyState("g", "P")
WheelUp::   Adjust("vol2", +1)
WheelDown:: Adjust("vol2", -1)
#HotIf

; --- FILTRO ---
; C = Filtro deck izquierdo
#HotIf GetKeyState("c", "P")
WheelUp::   Adjust("fil1", +1)
WheelDown:: Adjust("fil1", -1)
#HotIf

; V = Filtro deck derecho
#HotIf GetKeyState("v", "P")
WheelUp::   Adjust("fil2", +1)
WheelDown:: Adjust("fil2", -1)
#HotIf

; --- CROSSFADER ---
; X = Crossfader
#HotIf GetKeyState("x", "P")
WheelUp::   Adjust("xfader", +1)
WheelDown:: Adjust("xfader", -1)
#HotIf

; --- FX IZQUIERDO ---
; F1 = Perilla principal efecto 1 izquierdo
#HotIf GetKeyState("F1", "P")
WheelUp::   Adjust("fx1_izq", +1)
WheelDown:: Adjust("fx1_izq", -1)
#HotIf

; F2 = Perilla principal efecto 2 izquierdo
#HotIf GetKeyState("F2", "P")
WheelUp::   Adjust("fx2_izq", +1)
WheelDown:: Adjust("fx2_izq", -1)
#HotIf

; F3 = Perilla principal efecto 3 izquierdo
#HotIf GetKeyState("F3", "P")
WheelUp::   Adjust("fx3_izq", +1)
WheelDown:: Adjust("fx3_izq", -1)
#HotIf

; F4 = Volumen combinado FX izquierdo
#HotIf GetKeyState("F4", "P")
WheelUp::   Adjust("fxvol_izq", +1)
WheelDown:: Adjust("fxvol_izq", -1)
#HotIf

; --- FX DERECHO ---
; F5 = Perilla principal efecto 1 derecho
#HotIf GetKeyState("F5", "P")
WheelUp::   Adjust("fx1_der", +1)
WheelDown:: Adjust("fx1_der", -1)
#HotIf

; F6 = Perilla principal efecto 2 derecho
#HotIf GetKeyState("F6", "P")
WheelUp::   Adjust("fx2_der", +1)
WheelDown:: Adjust("fx2_der", -1)
#HotIf

; F7 = Perilla principal efecto 3 derecho
#HotIf GetKeyState("F7", "P")
WheelUp::   Adjust("fx3_der", +1)
WheelDown:: Adjust("fx3_der", -1)
#HotIf

; F8 = Volumen combinado FX derecho
#HotIf GetKeyState("F8", "P")
WheelUp::   Adjust("fxvol_der", +1)
WheelDown:: Adjust("fxvol_der", -1)
#HotIf

; --- TEMPO/PITCH ---
; A = Tempo deck izquierdo
#HotIf GetKeyState("a", "P")
WheelUp::   Adjust("tempo1", +1)
WheelDown:: Adjust("tempo1", -1)
#HotIf

; H = Tempo deck derecho
#HotIf GetKeyState("h", "P")
WheelUp::   Adjust("tempo2", +1)
WheelDown:: Adjust("tempo2", -1)
#HotIf

