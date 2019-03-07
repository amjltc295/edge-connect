ROOT_MASK_DIR="/project/project-mira3/datasets/FreeFromVideoInpainting/random_masks/test_set"
OUTPUT_DIR="/project/project-mira3/datasets/FreeFromVideoInpainting/file_lists"
declare -a types=("object_like" "object_like_middle" "object_like_middle_noBoarder" "object_like_noBoarder" "rand_curve" "rand_curve_noBoarder")
declare -a percentages=("5" "15" "25" "35" "45" "55" "uniform")
for t in "${types[@]}"
do
    for p in "${percentages[@]}"
    do
        MASK_DIR="$ROOT_MASK_DIR/$t/$p"
        OUTPUT_FILENAME="$OUTPUT_DIR/${t}_${p}.flist"
        echo ""
        echo "Doing python ./scripts/flist.py --path $MASK_DIR --output $OUTPUT_FILENAME"
        python ./scripts/flist.py --path $MASK_DIR --output $OUTPUT_FILENAME
    done
done

