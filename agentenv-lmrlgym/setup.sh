pip install -e ./lmrlgym --no-deps
pip install -r requirements_lmrlgym.txt
pip install -e .

FILE=./lmrlgym/LLM_RL/environment.py

# Define the marker to check if the replacement is already done
MARKER="# REPLACEMENT_DONE"

# Define the replacement content
REPLACEMENT="try:\n    from transformers.tokenization_utils import PreTrainedTokenizer\nexcept ImportError:\n    print('WARNING: transformers is not installed, please install it to use the TokenHistory, TokenTrajectory, and TokenTrajectoryChain classes')\n$MARKER"

# Check if the file already contains the unique marker
if ! grep -qF "$MARKER" "$FILE"; then
  # If not, use sed to find and replace the line
  sed -i "/from transformers.tokenization_utils import PreTrainedTokenizer/c\\$REPLACEMENT" "$FILE"
  echo "Content replaced successfully!"
else
  echo "Content already updated, no replacement needed."
fi