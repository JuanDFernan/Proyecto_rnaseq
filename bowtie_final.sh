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



module load  bowtie2/2.4.4
bowtie2 --quiet --very-sensitive-local --phred33  -x transcriptoma_index -1 G1_A_B1_22HWF7LT3_L006_R1.cor_trimmed.fq.gz -2 G1_A_B1_22HWF7LT3_L006_R2.cor_trimmed.fq.gz --threads 6 --met-file bowtie2_metrics.txt --al-conc-gz blacklist_paired_aligned.fq.gz --un-conc-gz blacklist_paired_unaligned.fq.gz --al-gz blacklist_unpaired_aligned.fq.gz \
--un-gz blacklist_unpaired_unaligned.fq.gz


