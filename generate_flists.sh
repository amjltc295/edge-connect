ROOT_MASK_DIR="/project/project-mira3/datasets/FreeFromVideoInpainting/forensics_all_masks"
OUTPUT_DIR="/project/project-mira3/datasets/FaceForensics/file_lists"
mkdir $OUTPUT_DIR
# declare -a types=("object_like_middle" "object_like_middle_noBoarder" "rand_curve" "rand_curve_noBoarder")
declare -a types=("test_object_like" "test_rand_curve" "test_bbox")
# declare -a percentages=("5" "15" "25" "35" "45" "55" "65" "uniform")
for t in "${types[@]}"
do
    MASK_DIR="$ROOT_MASK_DIR/$t"
    OUTPUT_FILENAME="$OUTPUT_DIR/${t}.flist"
    echo ""
    echo "Doing python ./scripts/flist.py --path $MASK_DIR --output $OUTPUT_FILENAME"
    python ./scripts/flist.py --path $MASK_DIR --output $OUTPUT_FILENAME
done

