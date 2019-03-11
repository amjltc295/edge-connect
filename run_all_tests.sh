FLIST_DIR="/project/project-mira3/datasets/FaceForensics/file_lists"
VIDEO_DIR="/project/project-mira3/datasets/FaceForensics/FaceForensics_full_crop/resize_128/test_32frames"
FLISTS=($(ls -f $FLIST_DIR))
echo "${FLISTS[@]}"
source activate edge-connect
for f in "${FLISTS[@]}"
do
    echo """ Doing
    python test.py \
     --checkpoints ./checkpoints/celeba \
     --input $VIDEO_DIR \
     --mask $FLIST_DIR/$f \
     --output ./outputs_faceforensics/edge_connect_FaceForensics_test_${f}_results

    """
    python test.py \
     --checkpoints ./checkpoints/celeba \
     --input $VIDEO_DIR \
     --mask $FLIST_DIR/$f \
     --output ./outputs_faceforensics/edge_connect_FaceForensics_test_${f}_results \
     --gpu 1

done
