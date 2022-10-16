#!/bin/bash -l
#SBATCH --job-name=example
#SBATCH --nodes=1
#SBATCH --ntasks=16
##SBATCH --time=0-0:05:00
#SBATCH --partition=titan_X
##SBATCH --array=1-5
#SBATCH --mail-user=korchemnyi.av@phystech.edu
#SBATCH --mail-type=END
#SBATCH --gres=gpu:1
#SBATCH --comment="Обучение нейросетевой модели в рамках НИР Центра когнитивного моделирования"

singularity instance start \
                     --nv  \
                     --bind /home/AI/yudin.da/korchemnyi_av/quantized_sa/src:/home/quantized_sa/ \
                     ml_env.sif ml_env

singularity exec instance://ml_env /bin/bash -c "
      source /miniconda/etc/profile.d/conda.sh;
      conda activate ml_env;
      set -x;
      nvidia-smi;
      free -m;
      cd /home/quantized_sa/;
      python3 main.py;
      free -m;
" > output.txt

singularity instance stop ml_env