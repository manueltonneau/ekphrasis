#!/bin/bash

COUNTRY_CODE=$1
FOLDER_NAME=$2

#SBATCH --job-name=generate_stats
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=50GB
#SBATCH --time=24:00:00
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-user=mt4493@nyu.edu

module purge
module load anaconda3/2019.10
source /scratch/mt4493/twitter_labor/code/envs/inference_env/bin/activate

DATA_FOLDER=/scratch/mt4493/twitter_labor/twitter-labor-data/data/pretraining/${COUNTRY_CODE}/${FOLDER_NAME}/
CODE_FOLDER=/scratch/mt4493/twitter_labor/code/repos_annexe/ekphrasis/ekphrasis/tools

echo 'Starting to run code'

python3 ${CODE_FOLDER}/generate_stats.py \
--input ${DATA_FOLDER} \
--name twitter_${COUNTRY_CODE} \
--ngrams 2 \
--mincount 70 30

echo 'Code has been run'