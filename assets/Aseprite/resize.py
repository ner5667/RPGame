#Stolen with adaptation from:
# https://github.com/MathIsFun0/Cryptid
#

import sys
from PIL import Image
import os

UPSCALE_FACTOR = 2


def upscale_pixel_art(input_image, output_directory, input_image_path):
    # Double the size
    new_size = (input_image.width * UPSCALE_FACTOR, input_image.height * UPSCALE_FACTOR)
    resized_image = input_image.resize(new_size, Image.NEAREST)  # NEAREST resampling preserves pixelation

    # Save the resized image
    filename = os.path.basename(input_image_path)
    output_image_path = os.path.join(output_directory, filename)
    resized_image.save(output_image_path)

if __name__ == "__main__":
    png_files = [file_path for file_path in os.listdir() if file_path[len(file_path)-4:] == ".png"]
    for file_path in png_files:
        input_image = Image.open(file_path)

        output_directory = "../resized/"
        upscale_pixel_art(input_image, output_directory, file_path)
