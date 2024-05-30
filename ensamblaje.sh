#!/bin/bash
#SBATCH -p normal # Partición (cola)
#SBATCH -N 1 # Número de nodos
#SBATCH -n 10 # Número de núcleos
#SBATCH -t 29-23:00 # Límite de tiempo (D-HH:MM)
#SBATCH -o salida.outdev # Salida STDOUT
#SBATCH -e error.errdev # Salida STDERR
# mail alert at start, end and abortion of execution
#SBATCH --mail-type=ALL

# send mail to this address
#SBATCH --mail-user=edgara.pardo@urosario.edu.co
#SBATCH --mail-user=juand.fernandez@urosario.edu.co

module load conda
source activate /datacnmat01/biologia/biologia.evolutiva/fabianc.salgado/POCtrinity/
module load perl/5.32.0

Trinity --seqType fq --SS_lib_type RF --max_memory 10G --CPU 8 \
--min_contig_length 2000 --left ./*R1.cor_trimmed.fq --right ./*R2.cor_trimmed.fq \
--output ./trinity_out
