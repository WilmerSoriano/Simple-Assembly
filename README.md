# ARM Assembly Examples Repository

Welcome! This repository showcases ARM assembly language programs, demonstrating low-level CPU register manipulation, memory operations, and implementation. Some examples include a C driver (`.c` files) paired with ARM assembly (`.s` files), while others are standalone assembly routines.

---

## 🛠️ Requirements

* **GNU ARM toolchain** (e.g., `arm-none-eabi-gcc`, `arm-none-eabi-as`, `arm-none-eabi-ld`)
* **QEMU** or **ARM hardware** for execution (optional emulator)
* Standard Unix shell (Linux/macOS) or Windows WSL

---

## 🔧 Building & Running Examples

### 1. C & Assembly Examples (`shift_and_count/`)

1. **Compile**

   ```bash
   cd shift_and_count

   # Assemble the .s files to object files
   arm-none-eabi-as -mcpu=cortex-m3 -g shiftLeftBy2.s -o shiftLeftBy2.o
   arm-none-eabi-as -mcpu=cortex-m3 -g countMatch.s    -o countMatch.o

   # Compile the C driver
   arm-none-eabi-gcc -mcpu=cortex-m3 -g -c shift.c -o shift.o

   # Link all objects into an executable
   arm-none-eabi-gcc -mcpu=cortex-m3 -g shift.o shiftLeftBy2.o countMatch.o -o shift_and_count.elf
   ```

2. **Run (QEMU)**

   ```bash
   qemu-arm -cpu cortex-m3 -singlestep -semihosting shift_and_count.elf
   ```

   * If using **semi-hosting**, ensure QEMU is invoked with `-semihosting`.
   * Otherwise, load `shift_and_count.elf` onto ARM hardware and run.

### 2. Assembly File only Examples (`standalone/`)

Each `.s` file assembles and links into a bare-metal ARM executable.

1. **Assemble & Link**

   ```bash
   cd standalone

   # Example: factorial.s
   arm-none-eabi-as -mcpu=cortex-m3 -g factorial.s -o factorial.o
   arm-none-eabi-ld -Ttext=0x0 factorial.o -o factorial.elf
   ```

2. **Run (QEMU)**

   ```bash
   qemu-arm -cpu cortex-m3 -singlestep -semihosting factorial.elf
   ```

---

## 📄 Tips & Notes

* Adjust `-mcpu` or `-march` flags based on your target ARM core.
* Use `arm-none-eabi-gdb` (or `gdb-multiarch`) to debug `.elf` files.
* Semi-hosting allows use of `printf` from C; ensure you link with `--specs=rdimon.specs -lc -lrdimon` if needed.

