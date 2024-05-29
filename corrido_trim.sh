#!/bin/bash
#SBATCH -p normal # Partición (cola)
#SBATCH -N 1 # Número de nodos
#SBATCH -n 8# Número de núcleos
#SBATCH -t 29-23:00 # Límite de tiempo (D-HH:MM)
#SBATCH -o salida.out # Salida STDOUT
#SBATCH -e error.err # Salida STDERR
# mail alert at start, end and abortion of execution
#SBATCH --mail-type=ALL

# send mail to this address
#SBATCH --mail-user=correo@urosario.edu.co

module load conda/4.9.2

source activate /datacnmat01/biologia/biologia.evolutiva/usuarios/class.fs/.conda/envs/ipyrad

trim_galore --cores 12 --phred33 --output_dir /datacnmat01/biologia/biologia.evolutiva/usuarios/class.fs/juan_fernandez/proyecto_RNA/filtered_reads --length 36 -q 5 --stringency 1 -e 0.1 *.cor.fq.gz

