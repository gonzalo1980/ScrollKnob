# ScrollKnob — Instalación

ScrollKnob es un sistema gratuito que te permite controlar todas las perillas y faders de Mixxx usando el teclado y la rueda del mouse, sin necesidad de un controlador físico.

---

## Requisitos

Antes de comenzar, necesitas descargar e instalar los siguientes programas. Todos son **gratuitos**.

| Programa | Descarga | Para qué sirve |
|---|---|---|
| **Mixxx 2.5** | [mixxx.org](https://mixxx.org) | El software de DJ |
| **AutoHotkey v2** | [autohotkey.com](https://www.autohotkey.com) | Convierte el teclado y la rueda en señales MIDI |
| **LoopMIDI** | [tobias-erichsen.de/software/loopmidi.html](https://www.tobias-erichsen.de/software/loopmidi.html) | Crea un puerto MIDI virtual para que Mixxx reciba las señales |

> ⚠️ Asegúrate de instalar **AutoHotkey v2**, no la versión 1.

---

## Archivos de ScrollKnob

El sistema incluye tres archivos que debes descargar:

| Archivo | Descripción |
|---|---|
| `mixxx_control.ahk` | Script principal que gestiona el teclado y la rueda del mouse |
| `Custom.kbd.cfg` | Configuración de atajos de teclado para Mixxx |
| `.midi.xml` | Configuración de asignaciones MIDI para Mixxx |

---

## Paso 1 — Configurar LoopMIDI

1. Abre **LoopMIDI**
2. En el campo de texto inferior escribe exactamente: `ScrollKnob MIDI`
3. Haz clic en el botón **+** para crear el puerto
4. **Deja LoopMIDI abierto** — debe estar corriendo siempre que uses ScrollKnob

---

## Paso 2 — Instalar el archivo de teclado en Mixxx

1. Abre el explorador de Windows
2. Escribe esta ruta en la barra de dirección y presiona Enter:
```
%LOCALAPPDATA%\Mixxx
```
3. Copia el archivo `Custom.kbd.cfg` dentro de esa carpeta
4. Si te pide reemplazar un archivo existente, acepta

> ⚠️ El archivo debe llamarse exactamente `Custom.kbd.cfg`. Windows a veces oculta las extensiones — verifica en **Ver → Opciones → Ver → desmarcar "Ocultar extensiones de archivo"**.

---

## Paso 3 — Instalar el archivo de configuración MIDI

1. En el explorador de Windows escribe esta ruta y presiona Enter:
```
%LOCALAPPDATA%\Mixxx\controllers
```
2. Copia el archivo `.midi.xml` dentro de esa carpeta
3. Si te pide reemplazar un archivo existente, acepta

---

## Paso 4 — Configurar Mixxx

1. Abre **Mixxx**
2. Ve a **Opciones → Preferencias** (o `Ctrl + P`)
3. En el panel izquierdo haz clic en **Controladores**
4. Busca **ScrollKnob MIDI** en la lista
5. En **Cargar mapeo**, haz clic en el ícono de engranaje con llave inglesa
6. Revisa que el check **Habilitado** esté activado
7. Haz clic en **Aplicar** y luego en **OK**
8. Cierra y vuelve a abrir Mixxx para que cargue el archivo de teclado

---

## Paso 5 — Ejecutar el script AutoHotkey

1. Haz doble clic en el archivo `mixxx_control.ahk`
2. Aparecerá el ícono de AutoHotkey en la bandeja del sistema (esquina inferior derecha)
3. Si aparece un mensaje de error sobre el puerto, verifica que LoopMIDI está corriendo con el puerto `ScrollKnob MIDI` activo

> ✅ El orden correcto de apertura es siempre: **LoopMIDI → mixxx_control.ahk → Mixxx**

---

## Paso 6 — Asignar las perillas en Mixxx *(opcional — solo si no tienes el archivo `.midi.xml`)*

Esta es la única vez que necesitas hacer este proceso. Una vez guardado, Mixxx recuerda la configuración para siempre.

1. En Mixxx ve a **Opciones → Preferencias → Controladores → ScrollKnob MIDI**
2. Haz clic en **Aprender**
3. Haz clic en una perilla de la interfaz de Mixxx, por ejemplo el **Volumen del Deck izquierdo**
4. Mantén presionada la tecla asignada (en este caso `S`) y gira la rueda del mouse
5. Mixxx detecta la señal y la asigna
6. Repite para cada perilla según la tabla de controles en `UTILIZACION.md`
7. Al terminar haz clic en **Listo** para guardar

> 💡 **Tip:** Antes de girar la rueda, haz clic en la forma de onda del deck para asegurarte que el foco está en el deck y no en la biblioteca.

---

## Orden de asignación recomendado *(solo si realizas el Paso 6)*

| # | Tecla + rueda | Control en Mixxx |
|---|---|---|
| 1 | `S` + rueda | Volumen deck izquierdo |
| 2 | `G` + rueda | Volumen deck derecho |
| 3 | `3` + rueda | EQ High deck izquierdo |
| 4 | `E` + rueda | EQ Mid deck izquierdo |
| 5 | `D` + rueda | EQ Low deck izquierdo |
| 6 | `4` + rueda | EQ High deck derecho |
| 7 | `R` + rueda | EQ Mid deck derecho |
| 8 | `F` + rueda | EQ Low deck derecho |
| 9 | `C` + rueda | Filtro deck izquierdo |
| 10 | `V` + rueda | Filtro deck derecho |
| 11 | `X` + rueda | Crossfader |
| 12 | `A` + rueda | Tempo deck izquierdo |
| 13 | `H` + rueda | Tempo deck derecho |
| 14 | `F1` + rueda | Perilla efecto 1 deck izquierdo |
| 15 | `F2` + rueda | Perilla efecto 2 deck izquierdo |
| 16 | `F3` + rueda | Perilla efecto 3 deck izquierdo |
| 17 | `F4` + rueda | Volumen combinado FX deck izquierdo |
| 18 | `F5` + rueda | Perilla efecto 1 deck derecho |
| 19 | `F6` + rueda | Perilla efecto 2 deck derecho |
| 20 | `F7` + rueda | Perilla efecto 3 deck derecho |
| 21 | `F8` + rueda | Volumen combinado FX deck derecho |

---

## Solución de problemas

**ScrollKnob MIDI no aparece en Mixxx**
- Verifica que LoopMIDI está corriendo con el puerto activo
- Verifica que el script AHK está ejecutándose (ícono en la bandeja)
- Cierra y vuelve a abrir Mixxx

**El script AHK muestra error de puerto**
- El nombre del puerto en LoopMIDI debe ser exactamente `ScrollKnob MIDI`
- Verifica mayúsculas y espacios

**Los atajos de teclado (W, T, Q, Y, etc.) no funcionan**
- Verifica que el archivo `Custom.kbd.cfg` está en la carpeta correcta
- Verifica que el nombre del archivo es exacto, sin `.txt` al final
- Reinicia Mixxx
