#!/bin/bash
#SBATCH --job-name=Detox_analysis
#SBATCH --open-mode=append
#SBATCH --output=/scratch/skp327/nlu_final/results/%j_%x.out
#SBATCH --error=/scratch/skp327/nlu_final/results/%j_%x.err
#SBATCH --export=ALL
#SBATCH --account=ds_ga_1012_2022sp
#SBATCH --partition=n1s8-v100-1
#SBATCH --time=08:00:00
#SBATCH --gres=gpu:1
#SBATCH --mem=20G
#SBATCH -c 4

singularity exec --nv --bind /scratch --overlay /scratch/skp327/overlay-25GB-500K.ext3:ro /scratch/skp327/cuda11.4.2-cudnn8.2.4-devel-ubuntu20.04.3.sif /bin/bash -c "
source /ext3/env.sh
conda activate
python /home/skp327/nlu_final/Detox_analysis.py /scratch/skp327/nlu_final/Detox_Dataset
"