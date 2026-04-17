import sys
import os
import random
import subprocess
from pathlib import Path

if len(sys.argv[1]) == 0:
    exit(0)

devnull = subprocess.DEVNULL

if sys.argv[1] == "image":
    link = Path("/tmp/wallpaper")
    images = [
        image.decode()
        for image in subprocess.check_output(
            [
                "find",
                Path.home() / ".local/share/wallpapers",
                "-regextype",
                "posix-extended",
                "-iregex",
                r".*\.(jpg|png|jpeg|webp)$",
                "-print0",
            ],
            stderr=devnull,
        ).split(b"\0")[:-1]
    ]

    if link.exists():
        if link.is_symlink():
            current_image = (
                subprocess.check_output(["readlink", link], stderr=devnull)
                .decode()
                .strip()
            )
            images.remove(current_image)
        else:
            os.remove(link)

    image = random.choice(images)
    position = random.choice(
        [
            "top-left",
            "top-right",
            "top",
            "bottom-left",
            "bottom-right",
            "bottom",
            "left",
            "right",
        ]
    )
    os.system(
        "awww img -a -t grow "
        + image
        + " --transition-pos "
        + position
        + " --transition-step 90 --transition-duration 1"
    )
    os.system("ln -sf " + image + " /tmp/wallpaper")
elif sys.argv[1] == "video":
    link = Path("/tmp/livevideo")
    videos = [
        video.decode()
        for video in subprocess.check_output(
            [
                "find",
                Path.home() / ".local/share/wallpapers",
                "-regextype",
                "posix-extended",
                "-iregex",
                r".*\.(mp4|mkv|webm|gif|mpeg|mov)$",
                "-print0",
            ],
            stderr=devnull,
        ).split(b"\0")[:-1]
    ]

    if link.exists():
        if link.is_symlink():
            current_video = (
                subprocess.check_output(["readlink", link], stderr=devnull)
                .decode()
                .strip()
            )
            videos.remove(current_video)
        else:
            os.remove(link)

    video = random.choice(videos)
    os.system("mpvpaper -f '*' -o '--loop-playlist=inf' -s -p " + video)
    os.system("ln -sf " + video + " /tmp/livevideo")
