# mb-decomp
 
## How to Build

### Linux (Ubuntu/Mint)

* Place a copy of the `BALL.BIN` file from the Monkey Ball GD-ROM inside the root directory of this repository and name it `baserom.bin`.
* Install `binutils-sh4-linux-gnu`.
* In the mb-decomp directory, run `make`.

### Windows (MSYS2)

* Place a copy of the `BALL.BIN` file from the Monkey Ball GD-ROM inside the root directory of this repository and name it `baserom.bin`.
* Build and install SH4 Binutils
  * Download and extract the latest binutils from [here](https://ftp.gnu.org/gnu/binutils/)
  * Install prerequisites like `gcc`, `make` `diffutils` and `texinfo`.
  * Enter the binutils directory and run `./configure --prefix="$HOME/sh-elf-binutils" --target=sh-elf`
  * Run `make -j4 install`
  * Add the newly built binutils to your PATH (`export PATH="$PATH:$HOME/sh-elf-binutils/bin`)
* In the mb-decomp directory, run `make CROSS_PREFIX=sh-elf-`.
