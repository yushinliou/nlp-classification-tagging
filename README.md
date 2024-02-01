# Homework 1 ADL NTU

## Environment
```shell
# 創造一個專門執行intent/slot的conda環境
make
conda activate adl-hw1
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

