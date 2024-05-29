#!/bin/bash
#SBATCH -p normal # Partición (cola)
#SBATCH -N 1 # Número de nodos
#SBATCH -n 10# Número de núcleos
#SBATCH -t 29-23:00 # Límite de tiempo (D-HH:MM)
#SBATCH -o salida.out # Salida STDOUT
#SBATCH -e error.err # Salida STDERR
# mail alert at start, end and abortion of execution
#SBATCH --mail-type=ALL

# send mail to this address
#SBATCH --mail-user=edgara.pardo@urosario.edu.co

module load python/2.7.10


python2 /opt/ohpc/pub/apps/TranscriptomeAssemblyTools/FilterUncorrectabledPEfastq.py \
-1 G1_A_W3_22HWF7LT3_CCTCTACATG-GATACCTCCT_L006_R1.cor_trimmed.fq.gz -2 G1_A_W3_22HWF7LT3_CCTCTACATG-GATACCTCCT_L006_R2.cor_trimmed.fq.gz
