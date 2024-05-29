#!/bin/bash
#SBATCH -p normal # Partición (cola)
#SBATCH -N 1 # Número de nodos
#SBATCH -n 5  # Número de núcleos
#SBATCH -t 29-23:00 # Límite de tiempo (D-HH:MM)
#SBATCH -o salida.out # Salida STDOUT
#SBATCH -e error.err # Salida STDERR
# mail alert at start, end and abortion of execution
#SBATCH --mail-type=ALL

# send mail to this address
#SBATCH --mail-user=edgara.pardo@urosario.edu.co

# Define la carpeta donde se encuentran los archivos FASTQ
folder="/home/class.fs/data/juan_fernandez/proyecto_RNA"

# Bucle for para iterar sobre los archivos
for file_R1 in "$folder"/G1_A_B1_22HWF7LT3_ACTTCAAGCG-GAACCATGAA_L006_R1.fastq.gz \
                "$folder"/G1_A_B2_22HWF7LT3_TCAGAAGGCG-GGCCATCATA_L006_R1.fastq.gz \
                "$folder"/G1_A_W2_22HWF7LT3_TTGGAATTCC-ACGTCAATAC_L006_R1.fastq.gz \
                "$folder"/G1_A_W3_22HWF7LT3_CCTCTACATG-GATACCTCCT_L006_R1.fastq.gz
do
    # Genera el nombre del archivo R2 correspondiente
    file_R2="${file_R1/_R1/_R2}"

    # Ejecuta el comando run_rcorrector.pl para los archivos R1 y R2 actuales
    run_rcorrector.pl -t 10 -1 "$file_R1" -2 "$file_R2" -od filtered_reads

    # Puedes agregar cualquier otra operación que necesites realizar después de cada iteración aquí
done
