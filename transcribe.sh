python -m pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
python -m pip install openai-whisper

python -OO -m whisper file.mp3 --model small --language es --output_format txt --device cuda
