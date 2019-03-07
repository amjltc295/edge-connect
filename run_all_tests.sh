FLIST_DIR="/project/project-mira3/datasets/FreeFromVideoInpainting/file_lists"
VIDEO_DIR="/tmp2/yaliangchang/Free_Form_Video_Inpainting_with_Gated_Convolution/dataset/test_20181109_rename_num"
FLISTS=($(ls -f $FLIST_DIR))
echo "${FLISTS[@]}"
source activate edge-connect
for f in "${FLISTS[@]}"
do
    echo """ Doing
    python test.py \
     --checkpoints ./checkpoints/places2 \
     --input $VIDEO_DIR \
     --mask $FLIST_DIR/$f \
     --output ./outputs/edge_connect_VOR_test_${f}_results

    """
    python test.py \
     --checkpoints ./checkpoints/places2 \
     --input $VIDEO_DIR \
     --mask $FLIST_DIR/$f \
     --output ./outputs/edge_connect_VOR_test_${f}_results

done
