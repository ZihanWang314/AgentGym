pip install -e ./lmrlgym --no-deps
pip install -r requirements_lmrlgym.txt
pip install -e .

FILE=./lmrlgym/LLM_RL/environment.py

# Use sed to find and replace the line
sed -i "/from transformers.tokenization_utils import PreTrainedTokenizer/c\try:\n    from transformers.tokenization_utils import PreTrainedTokenizer\nexcept ImportError:\n    print('WARNING: transformers is not installed, please install it to use the TokenHistory, TokenTrajectory, and TokenTrajectoryChain classes')" "$FILE"

echo "Content replaced successfully!"

