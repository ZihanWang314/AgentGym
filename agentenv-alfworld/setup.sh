pip install -r requirements_alfworld.txt  # prevent the need to download torch
pip install torch==2.2.0+cpu --index-url https://download.pytorch.org/whl/cpu
pip install torchvision==0.17.0+cpu --index-url https://download.pytorch.org/whl/cpu
pip install torchaudio==2.2.0 --index-url https://download.pytorch.org/whl/cpu
pip install opencv-python # originally uninstall here in official codebase. would run error.

pip install alfworld --no-deps

pip install -e .
export ALFWORLD_DATA=~/.cache/alfworld
python agentenv_alfworld/download.py # like alfworld-download
