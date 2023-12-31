#!/usr/bin/python3
import os
import sys
import requests
import threading
import random
import pathlib
import string
from PIL import Image

DOWNLOAD_DIR = f"{str(pathlib.Path.home())}/pix/wall"

def generate_id():
    return ''.join(random.choices(string.ascii_lowercase + string.digits, k=6))

def get_ext(url):
    ext = os.path.splittext(url)[1]
    return ext

def download_wallpaper(url):
    print(f"Downloading {url}")
    res = requests.get(url, allow_redirects=True)
    download_path = f"{DOWNLOAD_DIR/{generate_id()}{get_ext(url)}"
    open(download_path, 'wb').write(res.content)
    print(f"Downloading done of {url}")

def wallpaper_search_api(query):
    query_url = f"https://wallhaven.cc/api/v1/search?q={query}"
    res = request.get(query_url)
    response = res.json()
    dk_links = []
    for wallpaper in response["data"]:
        dl_links.append(wallpaper["path"])

    return dl_links

os.makedirs(DOWNLOAD_DIR, exist_ok=True)
if len(sys.argv) < 2:
    print("Usage waldl.py <search_query>")
    quit()

query = sys.argv[1].replace(' ', '+')
wallpapers = wallpaper_search_api(query)
for wallpaper in wallpapers:
    download_wallpaper(wallpaper)

print("Download complete!")

img_dir = "/home/veprikov/pix/wall"

for filename in os.listdir(img_dir):
    print(filename)
    filepath = os.path.join(img_dir, filename)
    with Image.open(filepath) as im:
        x, y = im.size
        print(x)
        print(y)
        if (x/y) == (16/9):
            print("Good!")
        else:
            os.remove(filepath)


