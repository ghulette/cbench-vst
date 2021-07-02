# Notes from Geoff

(Appel's paper)[https://www.cs.princeton.edu/~appel/papers/sqrt.pdf].

This should be enough to set up the code and be able to step through it in Proof
General or what-have-you.

## How to install the tools

1. Install opam
2. Install gappa (from source)
```
$ sudo apt install libmpfr-dev libboost-dev libgmp-dev
$ ./configure --prefix=$HOME/.local
$ ./remake install
$ gappa -v
Gappa 1.3.5
```
3. Add the coq.io repo to opam
```
$ opam repo add coq-released https://coq.inria.fr/opam/released
```
4. Install coq etc. (this will take some time)
```
$ opam install coq coq-vst coq-gappa coq-compcert coq-coquelicot coq-flocq
```

# Build the example

```
$ cd cbench-vst/sqrt
$ make
```

At this point everything will definitely work and there will be no problems whatsoever.
