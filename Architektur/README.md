# Architektur
## Ganz kleine Erklärung der Linux-Kernel-API
- wie interagiert der Nutzer mit dem Computer? (Was darf er machen? Was nicht?)
- was ist ein Systemcall?
___
## Was ist ein Stack?
- Konzept der Stack-Datenstruktur
- wozu ist er nützlich?
- Beispiel in x86
___
## Was ist der Heap?
- speicher layout (x86)
___
## Wie kriegt man Heapspeicher?
- Linux beispiel anhand des SBRK-systemcall-wrappers: Malloc
___
## Wie ist der Speicher aufgebaut? (addressbus, datenbus, kontrollbus)
## Memory Mapped I/O (kleines Beispiel mit einem Programm, das am Bootsektor liegt)
___
## kleine einführung zu x86
- Register (%eax, %ebx, %ecx, %edx, %esi, %esp, %ebp, %esi, %xmm0, %zmm0 usw.)
___
# Praktische Beispiele (generiert mit gcc datei.c -S)

## Lokale Variablen
## Globale Variablen
## Grundlegende Rechnungen (addl %eax, %ebx)
## source destination Reihenfolge(INTEL-, AT&T-Syntax)
## speicher operanden (shrl %eax, -4(%ebp))
## Wieso sind Pointer so Nützlich?
___
___

# *Informationen*

## https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html
## https://gcc.gnu.org/onlinedocs/
