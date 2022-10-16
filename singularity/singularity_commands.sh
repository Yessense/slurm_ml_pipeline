# Save Image to archive
docker save -o ml_env.tar ml_env:latest

# Build singularity image using custom path to tmp dir
# -E pass environment variables
export SINGULARITY_CACHEDIR=/home/yessense/data/.singularity/cache/  && \
export SINGULARITY_TMPDIR=/home/yessense/data/.singularity/tmp/ && \
sudo -E singularity build ml_env.sif docker-archive://ml_env.tar

# Enter shell
singularity shell --nv ml_env.sif

# Activate miniconda env
source /miniconda/etc/profile.d/conda.sh
conda activate ml_env

project_dir=${""}
# Bind project directory
singularity instance start \
                     --nv  \
                     --bind /home/yessense/data/docker_ml_pipeline/src/:/home/src/ \
                     ml_env.sif ml_env
singularity instance stop ml_env

singularity shell instance://ml_env
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