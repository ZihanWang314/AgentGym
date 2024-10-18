### setup. 
### This will create a conda environment for each agent environment. Then, each environment will be run independently and agent applications will interact with them through http requests.
### when using bash setup.sh, it will show "CommandNotFoundError: Your shell has not been properly configured to use 'conda activate'."
### so, you need to run the following commands manually:

CONDA_HOME=/opt/conda
source ${CONDA_HOME}/etc/profile.d/conda.sh # initialize conda for non-interactive shell

python_version=3.12 

pushd agentenv-alfworld
conda create -n agentenv-alfworld python=${python_version} -y
conda activate agentenv-alfworld
bash ./setup.sh # notice that alfworld env itself does not require torch, so we don't download here
popd

pushd agentenv-babyai
conda create -n agentenv-babyai python=${python_version} -y
conda activate agentenv-babyai
pip install -e .
popd

pushd agentenv-sciworld
conda create -n agentenv-sciworld python=${python_version} -y
conda activate agentenv-sciworld
pip install -e .
popd

pushd agentenv-textcraft
conda create --name agentenv-textcraft python=${python_version} -y
conda activate agentenv-textcraft
pip install -e .
popd

git submodule init && git submodule update
pushd agentenv-lmrlgym
conda create --name agentenv-lmrlgym python=${python_version} -y
conda activate agentenv-lmrlgym
bash ./setup.sh
popd



## setup failed on quest server :(
# pushd agentenv-webshop
# conda env create -n agentenv-webshop -f environment.yml
# conda activate agentenv-webshop
# bash ./setup.sh
# popd



# deprecated:
# pushd agentenv-sqlgym
# conda create --name agentenv-sqlgym python=3.9 -y
# conda activate agentenv-sqlgym
# pip install -e .
# bash setup.sh
# popd

