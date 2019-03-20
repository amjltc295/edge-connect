import os
import argparse
import numpy as np

parser = argparse.ArgumentParser()
parser.add_argument('--path', type=str, help='path to the dataset')
parser.add_argument('--output', type=str, help='path to the file list')
args = parser.parse_args()

ext = {'.jpg', '.png'}

max_len = 32
images = []
dirs = os.listdir(args.path)
for dirname in sorted(dirs):
    print('loading ' + dirname)
    dirname = os.path.join(args.path, dirname)
    files = os.listdir(dirname)
    for file in sorted(files)[:max_len]:
        print(file)
        if os.path.splitext(file)[1] in ext:
            images.append(os.path.join(dirname, file))

images = sorted(images)
np.savetxt(args.output, images, fmt='%s')
