#!/bin/bash
# Build and run the C + Assembly prime counter
set -e

# Build Rust static library
cd rust_prime_pairs
cargo build --release
cd ..

# Build Go shared library
go build -buildmode=c-shared -o libfibpairs.so fib_pairs.go

# Assemble the assembly file
nasm -f elf64 count_primes.asm -o count_primes.o

# Compile and link everything
# -L to add Rust lib path, -l to link static Rust lib
# -lpthread and -ldl are sometimes needed for Rust FFI and Go FFI
gcc -no-pie -o main main.c count_primes.o -Lrust_prime_pairs/target/release -lrust_prime_pairs -L. -lfibpairs -lpthread -ldl -Wl,-rpath,.

./main
