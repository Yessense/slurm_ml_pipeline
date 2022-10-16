# Посмотреть на все процессы
squeue 

# Процессы конкретного пользователя
squeue -u yudin.da

# Процессы по partition
squeue --partition=GTX780

squeue - Job States
    R - Job is running on compute nodes
    PD - Job is waiting on compute nodes
    CG - Job is completing

squeue - Job Reasons
    (Resources) - Job is waiting for compute nodes to become available
    (Priority) - Jobs with higher priority are waiting for compute nodes.  Check this knowledge base article for info about job priority
    (ReqNodeNotAvail) - The compute nodes requested by the job are not available for a variety of reasons, including:
        cluster downtime
        nodes offline
        temporary scheduling backlog

# Характеристики конкретных разделов
sinfo
/*
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
RT_build     up 1-00:00:00      1   idle node20-1
RT_study     up 7-00:00:00      9  alloc node20-[2-10]
RT*          up 30-00:00:0      7 drain* node20-[97,99,104,106,110-112]
RT*          up 30-00:00:0     15  down* node20-[23,30,35,52,60-62,66,68-69,79-80,88,98,108]
RT*          up 30-00:00:0     15  drain node20-[11,13-15,29,38-40,54,72-73,100-102,105]
RT*          up 30-00:00:0      1    mix node20-42
RT*          up 30-00:00:0     47  alloc node20-[12,16-20,24-28,31-34,36-37,41,43-46,49,53,55-58,63-65,74-78,81-87,94-96,107]
RT*          up 30-00:00:0     17   idle node20-[21-22,47-48,50-51,59,67,70-71,89-93,103,109]
AI           up   infinite      6  alloc node6-[22,24,26,28,30],node7-22
GTX780       up   infinite      1   idle node5-6
titan_X      up   infinite      3   idle node5-[11,16,21]
DGX-1v100    up   infinite      1   resv node6-7
DGX-1v100    up   infinite      1    mix node6-2
LFS          up   infinite      2   idle node13-[3-4]
*/

# Дополнительная информация о разделах
sinfo -o "%20P %5D %14F %8z %10m %10d %11l %16f %N"

# Интерактивный запуск
srun

srun --time=0:05:00 --partition=GTX780  --nodes=1 --ntasks=16 --gres=gpu:1 --pty /bin/bash

# Чтобы выйти из интерактивного режима
exit

# batch-запуск
sbatch


# Статусы запуска 
/*
PD - PENDING
R - RUNNING
CJ - CANCLELED BY JOB
*/

# Отмена задачи
scancel

# Посмотреть информацию про конкретную задачу
scontrol show job 1234

# ---------------------------------------------------------------------------------
# Информация об оборудовании
# ---------------------------------------------------------------------------------

# версия Linux
cat /proc/version

# версия дистрибутива Linux
lsb_release -a

# видеокарта
nvidia-smi

# cuda compiler
nvcc --version

# Процессор
cat /proc/cpuinfo

# процессор
lscpu

# оперативная память
grep MemTotal /proc/meminfo

# диск
df -h

# права в Google Colab
whoami