# "${1}" is the first argument passed to the script
# "${2}" is the second argument passed to the script
python3 test_slot.py --test_file "${1}" --ckpt_path slot.pth --pred_file "${2}"