CURRENT_DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
export CUDA_VISIBLE_DEVICES="0"
export BERT_BASE_DIR=$CURRENT_DIR/prev_trained_model/chinese_roberta_wwm_large_ext_L-24_H-1024_A-16
export GLUE_DIR=$CURRENT_DIR/../../glue/chineseGLUEdatasets/
TASK_NAME="xnli"

python run_classifier.py \
  --task_name=$TASK_NAME \
  --do_train=true \
  --do_eval=true \
  --do_predict=true \
  --data_dir=$GLUE_DIR/$TASK_NAME \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --max_seq_length=128 \
  --train_batch_size=16 \
  --eval_batch_size=64 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --output_dir=$CURRENT_DIR/${TASK_NAME}_output/
