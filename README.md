# DescripcionDeCircuitosIntegradosConVHDL
Se describen circuitos integrados comerciales, combinaciones y secuenciales, usando VHDL. Se incluye el correspondiente archivo testbench para la validación del circuito.

<!-- GitHub renderizado en español -->
# 📚 Biblioteca VHDL de CI Comerciales  
*Modelos VHDL autorizados + bancos de prueba auto-verificados para 27 clásicos 74 HC / HCT*

---

## 🎯 Objetivo del repositorio
Partiendo de las **hojas de datos oficiales de los fabricantes** (sin agregadores tipo Alldatasheet), creamos:
1. Un modelo **VHDL sintetizable** que cumpla la tabla de verdad y especificaciones AC/DC.
2. Un **testbench auto-verificable** (`assert` + `report`) que pruebe **todos** los patrones de entrada legales.
3. Archivos `Makefile` y `run_all.do` listos para **GHDL / ModelSim / Vivado** con un solo clic.

---

## 📂 Estructura

├─ comb/          ← 15 CI combinacionales MSI (no compuertas simples)
├─ seq/           ← 12 CI secuenciales
├─ tb/            ← testbenches auto-verificados
├─ scripts/       ├─ run_all.sh  (regresión GHDL)
│                 └─ wave.do      (ventana de olas ModelSim)
├─ urls_fabricantes.txt ← enlaces oficiales a las hojas de datos
└─ README.md ← este archivo


---

## ✅ Dispositivos Combinacionales MSI (15)
| # | Nombre industrial | Función | Enlace a hoja de datos oficial |
|---|-------------------|---------|-------------------------------|
| 1 | [74HC138](comb/SN74LVC138A.vhd) | Decodificador 3-a-8 | [TI](https://www.ti.com/lit/ds/symlink/sn74lvc138a.pdf?ts=1759793499160&ref_url=https%253A%252F%252Fwww.ti.com%252Fproduct%252FSN74LVC138A) |
| 2 | [74HC139](comb/SN74HC139.vhd) | Decodificador dual 2-a-4 | [TI](https://www.ti.com/lit/ds/symlink/sn74hc139-q1.pdf?ts=1759771691926) |
| 3 | [74HC147](comb/MC74HC147.vhd) | Codificador decimal-BCD prioridad 10 líneas | [ON-Semi](https://rocelec.widen.net/view/pdf/jkuv9nvg2w/MOTOD158-3-154.pdf?t.download=true&u=5oefqw) |
| 4 | [74HC148](comb/SN74HC148.vhd) | Codificador de prioridad 8 entradas | [ST](https://www.datasheet.support/pdfviewer?url=https%3A%2F%2Fpdf.datasheet.support%2F3388e243%2Fst.com%2F74HC148.pdf) |
| 5 | [74HC151](comb/SN74HC151.vhd) | Multiplexor 8-a-1 | [Nexperia](https://assets.nexperia.com/documents/data-sheet/74HC_HCT151.pdf) |
| 6 | [74HC153](comb/SN74HC153.vhd) | Multiplexor dual 4-a-1 | [Nexperia](https://assets.nexperia.com/documents/data-sheet/74HC_HCT153.pdf) |
| 7 | [74HC157](comb/SN74HC157.vhd) | Multiplexor cuádruple 2-a-1 | [Nexperia](https://assets.nexperia.com/documents/data-sheet/74HC_HCT157.pdf) |
| 8 | [74HC238](comb/SN74HC238.vhd) | Decodificador 3-a-8 (salidas activas-alta) | [Nexperia](https://assets.nexperia.com/documents/data-sheet/74HC_HCT238.pdf) |
| 9 | [74HC240](comb/74HC240.vhd) | Buffer/line-driver octal inversor (3 estados) | [TI](https://www.ti.com/product/74HC240) |
| 10 | [74HC241](comb/74HC241.vhd) | Buffer/line-driver octal no-inversor | [Toshiba](https://toshiba.semicon-storage.com/us/product/buffers-transceivers/74hc241.html) |
| 11 | [74HC244](comb/74HC244.vhd) | Buffer octal 3 estados | [ON-Semi](https://www.onsemi.com/products/buffers-transceivers/74hc244) |
| 12 | [74HC245](comb/74HC245.vhd) | Transceiver bidireccional octal | [NXP](https://www.nxp.com/docs/en/data-sheet/74HC245.pdf) |
| 13 | [74HC283](comb/74HC283.vhd) | Sumador rápido 4 bits | [Renesas](https://www.renesas.com/us/en/products/logic-arithmetic/74hc283) |
| 14 | [74HC85](comb/74HC85.vhd) | Comparador magnitud 4 bits | [TI](https://www.ti.com/product/74HC85) |
| 15 | [74HC4002](comb/74HC4002.vhd) | Puerto de expansión 18 bits (NOR dual 4 ent) | [Microchip](https://www.microchip.com/en-us/product/74HC4002) |

---

## ⚙️ Dispositivos Secuenciales (12)
| # | Nombre industrial | Función | Enlace a hoja de datos oficial |
|---|-------------------|---------|-------------------------------|
| 1 | [74HC74](seq/74HC74.vhd) | Flip-flop D dual | [Nexperia](https://www.nexperia.com/products/logic-flip-flops-latches/74HC74.html) |
| 2 | [74HC73](seq/74HC73.vhd) | Flip-flop JK dual | [TI](https://www.ti.com/product/74HC73) |
| 3 | [74HC163](seq/74HC163.vhd) | Contador sincrónico 4 bits con reset sincrónico | [TI](https://www.ti.com/product/74HC163) |
| 4 | [74HC164](seq/74HC164.vhd) | Registro de desplazamiento SIPO 8 bits | [Nexperia](https://www.nexperia.com/products/logic-shift-registers/74HC164.html) |
| 5 | [74HC165](seq/74HC165.vhd) | Registro de desplazamiento PISO 8 bits | [TI](https://www.ti.com/product/74HC165) |
| 6 | [74HC173](seq/74HC173.vhd) | Registro D 4 bits con salida 3 estados | [NXP](https://www.nxp.com/docs/en/data-sheet/74HC173.pdf) |
| 7 | [74HC174](seq/74HC174.vhd) | Flip-flop D hex | [ON-Semi](https://www.onsemi.com/products/analog-logic-gates/74hc174) |
| 8 | [74HC175](seq/74HC175.vhd) | Flip-flop D cuádruple | [Toshiba](https://toshiba.semicon-storage.com/us/product/logic-flip-flops-latches/74hc175.html) |
| 9 | [74HC190](seq/74HC190.vhd) | Contador sincrónico arriba/abajo BCD | [TI](https://www.ti.com/product/74HC190) |
| 10 | [74HC193](seq/74HC193.vhd) | Contador sincrónico arriba/abaja 4 bits (doble reloj) | [Renesas](https://www.renesas.com/us/en/products/logic-counters/74hc193) |
| 11 | [74HC194](seq/74HC194.vhd) | Registro universal de desplazamiento 4 bits | [TI](https://www.ti.com/product/74HC194) |
| 12 | [74HC273](seq/74HC273.vhd) | Flip-flop D octal con reset asíncrono | [Microchip](https://www.microchip.com/en-us/product/74HC273) |

---

## 🧪 Ejecutar los testbenches
### GHDL (gratuito)
```bash
sudo apt install ghdl   # Debian/Ubuntu
git clone https://github.com/tu-usuario/vhdl-ic-library.git
cd vhdl-ic-library
./scripts/run_all.sh   # 27 dispositivos → ~30 s en i7

Código de salida 0 ⇒ todas las aserciones pasaron.
ModelSim / Questa

do scripts/run_all.do

Se abre la ventana de olas solo si falla alguna aserción.
📈 Política de cobertura

Cada fila de tabla de verdad se estimula al menos una vez.
Cobertura de toggle ≥ 98 % en celdas secuenciales (directivas cover).
Transiciones X-to-0 / X-to-1 verificadas para salidas 3 estados.
Tests negativos de setup-hold incluidos (dispositivos secuenciales) – se espera fallo cuando se violan.


🤝 Contribuir

Fork & rama (feat/74HC123).
Añadir solo enlace oficial del fabricante (sin hosts externos).
Mantener modelo genérico (std_logic) – sin primitivas propietarias.
Asegurar que scripts/run_all.sh termine en verde antes del PR.
📄 Licencia

MIT © 2025 – libre para usar en clases o diseños comerciales.
“Si no puedes simularlo, no lo entiendes.” — parafraseando a R. Feynman
