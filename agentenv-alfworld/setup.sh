pip install -r requirements_alfworld.txt  # prevent the need to download torch
pip install alfworld --no-deps

pip install opencv-python # originally uninstall here in official codebase. would run error.
pip install -e .
export ALFWORLD_DATA=~/.cache/alfworld
python agentenv_alfworld/download.py # like alfworld-download
