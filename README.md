# 'Hello World' rust application for OpenWRT

## Requirements

For this example to work you need to have the [`lang/rust` package]
(https://github.com/Itus-Shield/packages/tree/rust/lang/rust) from Grommish.
This package will build the `rustc` compiler and the `cargo` application from
source tuned for use with dynamically linked `musl` and softfloat MIPS and
MIPS64 targets.

The second dependency is the [`lang/rust-libstd` package]
(https://github.com/daanpape/rust-libstd) which takes the precompiled rust 
`libstd` dynamic library (`*.so`) and packs it in an installable `ipk` package.

## Compilation

To compile this minimal working example the following steps must be taken:
 1. Install and build the requirements.
 2. Clone this repository in the `package/lang` directory of the OpenWRT
    toolchain.
 3. Execute `make menuconfig` in the toolchain root and select the 
    `rust-hello-world` application in the `Languages` menu either with a `*` or
    `M` selector.
 4. Build the package by executing 
    `make V=s package/rust-hello-world/{clean,compile}` in the root of the
    toolchain.

When everything goes succesfull you now have an installable `ipk` in the 
`bin/packages/` directory.
