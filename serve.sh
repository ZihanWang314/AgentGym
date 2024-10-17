CONDA_PREFIX=$HOME/miniconda3
source ${CONDA_PREFIX}/etc/profile.d/conda.sh # initialize conda for non-interactive shell

conda activate agentenv-alfworld
pushd agentenv-alfworld
alfworld --host 0.0.0.0 --port 36001 &
popd

conda activate agentenv-babyai
pushd agentenv-babyai
babyai --host 0.0.0.0 --port 36002 &
popd

conda activate agentenv-sciworld
pushd agentenv-sciworld
sciworld --host 0.0.0.0 --port 36003 &
popd

conda activate agentenv-textcraft
pushd agentenv-textcraft
textcraft --host 0.0.0.0 --port 36004 &
popd

conda activate agentenv-lmrlgym
pushd agentenv-lmrlgym
lmrlgym --host 0.0.0.0 --port 36005 &
popd

# conda activate agentenv-webshop
# webshop --host 0.0.0.0 --port 36006
