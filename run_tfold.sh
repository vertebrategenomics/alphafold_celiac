#!/bin/bash
#SBATCH --job-name=tfold_gliadin
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jtorr179@ucsc.edu
#SBATCH --output=tfold_gliadin_%J.out
#SBATCH --error=tfold_gliadin_%J.err
#SBATCH --partition=windfall
#SBATCH --nodes=1
#SBATCH --mem=40G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --gres=gpu:l40s:1
#SBATCH --time=1-0

export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$LD_LIBRARY_PATH
module load miniconda3/3.13
conda activate tfold-env
cd /hb/scratch/jtorr179/tfold-release
/hb/scratch/jtorr179/tfold-release/model_pmhcs.sh /hb/scratch/jtorr179/tfold_input/mhc_tfold_input.csv /hb/scratch/jtorr179/tfold_input -d 2018-04-30
