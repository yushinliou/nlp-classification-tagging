# Intent Classification & Slot Tagging
## Task describe
* Part 1: Intent Classification
  * Input: Text
    * "i dont like my current insurance plan and want a new one",
    * "when will my american express credit card expire",
    * "how would i get to city hall via bus",
      
  * Output: Intent
    * "insurance_change",
    * "expiration_date",
    * "directions"
* Part 2: Slot Tagging
* Input: Text
  * "A table today for myself and 3 others"
  * "My three children and i are in the party"
* Output: Intent
  * "O O B-date O B-people I-people I-people O"
  * "B-people I-people I-people
  * I-people I-people O O O O"
## Evaluation
* Intent Classification
  * Accuracy
* Slot Tagging
  * Joint Accuracy
  * A sample is correct only if all tokens are predicted correctly.

## Environment
```shell
# Create a conda environment specifically for running intent/slot
make
conda activate intent
# pip install -r requirements.txt
# Otherwise
# Install required packages
pip install -r requirements.in
```
## Reproduce
```
# Download slot.pth, intent.pth, test_intent.json, test_slot.json files
# test_intent.json, test_slot.json are the original test datasets
bash download.sh
# Reproduce intent
bash ./intent_cls.sh intent_test.json predict/pred_intent.csv
# Slot
bash ./slot_tag.sh slot_test.json predict/pred_slot.csv

## Preprocessing
```shell
# To preprocess intent detection and slot tagging datasets
# preprocess_train.py, preprocess_slot.py, will read glove840b.300d.txt, and train.json, eval.json files
# Generate ckpt, for later use in text tokenization into vocal.pkl, embedding.pt, tag2idx.json, intent2idx.json
bash preprocess.sh
```
## Train model
### Intent detection
```
# Read eval.json, train.json from ./data, vocal.pkl, embedding.pt, intent2idx.json from ./cache
# Produce model intent.pth
# Read ./data/test.json
# Write prediction results to './predict/pred_intent.csv'
python intent.py 
```
### Slot
```
# Read eval.json, train.json from ./data, vocal.pkl, embedding.pt, tag2idx.json from ./ckpt
# Produce model ./ckpt/slot.pth
# Read ./data/test.json
# Write test results to './predict/pred_slot.csv'
python slot.py 
```
Please see `report.pdf` for more detailed information, including model structure, perofrmance and the model config.
_______
# Chinese version
## Environment
```shell
# 創造一個專門執行intent/slot的conda環境
make
conda activate intent
# pip install -r requirements.txt
# Otherwise
# 執行需要的套件
pip instsall -r requirements.in
```

# reproduce
```shell
# 下載slot.pth, intent.pth, test_intent.json, test_slot.json檔案
#  test_intent.json, test_slot.json是原本的測試資料集
bash download.sh
# reporduce intent
bash ./intent_cls.sh intent_test.json predict/pred_intent.csv
# slot
bash ./slot_tag.sh slot_test.json predict/pred_slot.csv

## Preprocessing
```shell
# To preprocess intent detectiona and slot tagging datasets
# preprocess_train.py, preprocess_slot.py，會讀取glove840b.300d.txt，以及train.json, eval.json檔案
# 生成ckpt, 用於後續將文本tokenize vocal.pkl, embedding.pt, tag2idx.json, intent2idx.json
bash preprocess.sh
```
# train model

## Intent detection
```shell
# 讀取./data當中的eval.json, train.json, ./cache/vocal.pkl, embedding.pt, intent2idx.json
# 產出模型intent.pth
# 讀取 ./data/test.json
# 寫出預測結果到'./predict/pred_intent.csv'
python intent.py 
```

## Slot
```shell
# 讀取./data當中的eval.json, train.json, ./ckpt/vocal.pkl, embedding.pt, tag2idx.json
# 寫出模型./ckpt/slot.pth
# 讀取 ./data/test.json
# 寫出測試結果到'./predict/pred_slot.csv'
python slot.py 
```

