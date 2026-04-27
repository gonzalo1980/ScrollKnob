# ScrollKnob — Utilización

---

## Antes de empezar

Cada vez que vayas a usar ScrollKnob, ábrelos en este orden:

1. **LoopMIDI** — verifica que el puerto `ScrollKnob MIDI` está activo
2. **mixxx_control.ahk** — doble clic para ejecutarlo, verifica el ícono en la bandeja del sistema
3. **Mixxx** — ábrelo último

> ⚠️ Si abres Mixxx antes que LoopMIDI, no detectará el puerto y tendrás que reiniciar Mixxx.

---

## Mapa de controles

### Teclado puro — pulsación simple

| Tecla | Acción |
|---|---|
| `W` | Play / Pause deck izquierdo |
| `T` | Play / Pause deck derecho |
| `2` | Cue deck izquierdo |
| `5` | Cue deck derecho |
| `1` | Sync BPM deck izquierdo |
| `6` | Sync BPM deck derecho |
| `Q` | Activar / Desactivar loop deck izquierdo |
| `Y` | Activar / Desactivar loop deck derecho |

### Tecla mantenida + rueda del mouse

Mantén la tecla presionada y gira la rueda del mouse para ajustar el control.

| Tecla + rueda | Control |
|---|---|
| `S` + rueda | Volumen deck izquierdo |
| `G` + rueda | Volumen deck derecho |
| `3` + rueda | EQ High deck izquierdo |
| `E` + rueda | EQ Mid deck izquierdo |
| `D` + rueda | EQ Low deck izquierdo |
| `4` + rueda | EQ High deck derecho |
| `R` + rueda | EQ Mid deck derecho |
| `F` + rueda | EQ Low deck derecho |
| `C` + rueda | Filtro deck izquierdo |
| `V` + rueda | Filtro deck derecho |
| `X` + rueda | Crossfader |
| `A` + rueda | Tempo deck izquierdo |
| `H` + rueda | Tempo deck derecho |
| `F1` + rueda | Perilla efecto 1 deck izquierdo |
| `F2` + rueda | Perilla efecto 2 deck izquierdo |
| `F3` + rueda | Perilla efecto 3 deck izquierdo |
| `F4` + rueda | Volumen combinado FX deck izquierdo |
| `F5` + rueda | Perilla efecto 1 deck derecho |
| `F6` + rueda | Perilla efecto 2 deck derecho |
| `F7` + rueda | Perilla efecto 3 deck derecho |
| `F8` + rueda | Volumen combinado FX deck derecho |

### Tecla especial

| Tecla | Acción |
|---|---|
| `F9` | Activar / Desactivar ScrollKnob (toggle) |

> 💡 Usa `F9` cuando necesites escribir en la búsqueda de la biblioteca o usar el teclado normalmente sin que ScrollKnob interfiera. Presiónalo de nuevo para reactivarlo.

---

## Comportamiento del Cue

El cue funciona en modo CDJ, igual que las tornamesas profesionales:

- **Toque corto** → va al punto cue y se detiene
- **Mantener presionado** → reproduce desde el punto cue
- **Soltar** → vuelve al punto cue
- **Clic derecho en la forma de onda** → establece un nuevo punto cue

---

## Rutina de inicio — importante

> ⚠️ **Antes de cada sesión, prueba todas las perillas.** El sistema usa Soft Takeover, lo que significa que Mixxx y ScrollKnob pueden tener valores distintos al arrancar. Si no sincronizas las perillas antes de mezclar, un control puede no responder cuando más lo necesitas.

### ¿Qué es el Soft Takeover?

Cuando ScrollKnob arranca, no sabe en qué posición están las perillas en Mixxx. El Soft Takeover evita que las perillas salten bruscamente a un valor incorrecto — en cambio, espera a que el valor de ScrollKnob "alcance" el valor real de la perilla en Mixxx antes de tomar el control.

### ¿Cómo sincronizar una perilla?

Si una perilla no responde al girar la rueda:

1. Gira la rueda **hacia arriba** unas vueltas
2. Si sigue sin responder, gira **hacia abajo** unas vueltas
3. En algún punto la perilla se "enganchará" y comenzará a moverse — desde ese momento responde normalmente

### Rutina recomendada antes de mezclar

Antes de tu primera mezcla, recorre todos los controles en este orden:

1. `S` + rueda → sube y baja el volumen izquierdo
2. `G` + rueda → sube y baja el volumen derecho
3. `3`, `E`, `D` + rueda → recorre el EQ izquierdo (High, Mid, Low)
4. `4`, `R`, `F` + rueda → recorre el EQ derecho
5. `C` + rueda → mueve el filtro izquierdo
6. `V` + rueda → mueve el filtro derecho
7. `X` + rueda → mueve el crossfader de lado a lado
8. `F1` a `F4` + rueda → recorre los FX izquierdos
9. `F5` a `F8` + rueda → recorre los FX derechos

---

## Cambiar de efecto — sincronización

Cuando cambias un efecto en Mixxx, su perilla empieza desde 0. ScrollKnob puede tener guardado un valor diferente del efecto anterior, lo que causa que la perilla no responda de inmediato.

**Solución:** Gira la rueda hacia abajo hasta que la perilla llegue a 0 en Mixxx — en ese punto se enganchará y podrás subirla normalmente sin saltos.

---

## Ventajas

- **Gratuito** — no requiere ningún controlador físico ni software de pago
- **Ergonómico** — mano izquierda en el teclado, mano derecha en el mouse
- **Rápido** — acceso inmediato a todos los controles sin mover el mouse hasta la perilla
- **Portable** — tres archivos y está listo en cualquier computador
- **Compatible** — funciona con cualquier teclado estándar, no requiere hardware especial
- **Silencioso** — ideal para practicar sin equipamiento

---

## Desventajas

- **Soft Takeover** — requiere sincronizar las perillas al inicio de cada sesión y al cambiar efectos
- **Sin feedback visual** — ScrollKnob no sabe en qué posición está cada perilla en Mixxx, debes guiarte por la interfaz
- **Velocidad fija** — la velocidad de la rueda es la misma para todos los controles (ajustable en el script)
- **Windows solamente** — el script AutoHotkey funciona únicamente en Windows
- **Antivirus** — algunos antivirus como AVG pueden eliminar el archivo `.ahk` por considerarlo sospechoso (ver sección de solución de problemas en `INSTALACION.md`)
- **Requiere tres programas corriendo** — LoopMIDI, AutoHotkey y Mixxx deben estar abiertos simultáneamente

---

## Ajustar la velocidad de la rueda

Si la rueda gira demasiado rápido o muy lento, puedes ajustarlo editando el archivo `mixxx_control.ahk` con el Bloc de Notas. Busca esta línea al inicio:

```
STEP := 5
```

- `STEP := 3` → rueda lenta, más precisa
- `STEP := 5` → velocidad normal
- `STEP := 8` → rueda rápida, menos precisa

Guarda el archivo y vuelve a ejecutarlo para aplicar el cambio.
