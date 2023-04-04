#!/bin/sh -x


gfortran -g  -O -I include/ -c src/auto_constants.f90 -o    manual_lib/auto_constants.o
gfortran -g  -O -c src/f2003.f90 -o                          manual_lib/compat.o
gfortran -g  -O -c src/lapack.f -o                           manual_lib/lapack.o
gfortran -g  -O -c src/blas.f -o                             manual_lib/blas.o
gfortran -g  -O -c src/nompi.f90 -o                          manual_lib/mpi.o
gfortran -g  -O -c src/mesh.f90 -o                           manual_lib/mesh.o
gfortran -g  -O -c src/support.f90 -o                        manual_lib/support.o
gfortran -g  -O -c src/io.f90 -o                             manual_lib/io.o
gfortran -g  -O -c src/floquet.f90 -o                        manual_lib/floquet.o
gfortran -g  -O -c src/solvebv.f90 -o                        manual_lib/solvebv.o
gfortran -g  -O -c src/interfaces.f90 -o                     manual_lib/interfaces.o
gfortran -g  -O -c src/ae.f90 -o                             manual_lib/ae.o
gfortran -g  -O -c src/toolboxae.f90 -o                      manual_lib/toolboxae.o
gfortran -g  -O -c src/bvp.f90 -o                            manual_lib/bvp.o
gfortran -g  -O -c src/equilibrium.f90 -o                    manual_lib/equilibrium.o
gfortran -g  -O -c src/timeint.f90 -o                        manual_lib/timeint.o
gfortran -g  -O -c src/toolboxbv.f90 -o                      manual_lib/toolboxbv.o
gfortran -g  -O -c src/maps.f90 -o                           manual_lib/maps.o
gfortran -g  -O -c src/periodic.f90 -o                       manual_lib/periodic.o
gfortran -g  -O -c src/homcont.f90 -o                        manual_lib/homcont.o
gfortran -g  -O -c src/optimization.f90 -o                   manual_lib/optimization.o
gfortran -g  -O -c src/parabolic.f90 -o                      manual_lib/parabolic.o

gfortran -g  -O -c src/main.f90 -o                           manual_lib/main.o

echo " Now building ab demo..."

gfortran -g  -O -c demos/ab/ab.f90 -o ab.o
gfortran -g  -O ab.o -o ab.exe manual_lib/*.o
