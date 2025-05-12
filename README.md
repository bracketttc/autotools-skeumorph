# Autotools-skeumorphic wrappers for CMake

Everyone (of a certain tranche of nerd) knows the happy-path incantation to build and install an autotools project:

```shell
./configure
make
make install
```

For all of the reasons one might prefer CMake to autotools, a single canonical workflow is not one.
Also, everywhere I've ever used CMake professionally, people felt compelled to write shell scripts to do their configuration step.
Hence, this repository.
The happy-path build and installation matches autotools (provided that you install things in your CMake project).
