import sys
import os
import random
from pathlib import Path


def wallpaper_picker():
    if len(sys.argv) > 1:
        display = sys.argv[1]
        active_video = Path("/tmp/video-wallpaper")
        active_image = Path("/tmp/wallpaper")
        current_video = 0
        current_image = 0

        if active_video.exists():
            current_video = active_video.read_text()

        if active_image.exists():
            current_image = active_image.read_text()

        if display == "image":
            directory = Path.home() / ".local/share/wallpapers"
            formats = [".jpg", ".png", ".webp"]
            images = [
                str(image)
                for image in directory.rglob("*.*")
                if image.suffix.lower() in formats and image.is_file()
            ]

            if current_image != 0:
                try:
                    images.remove(current_image)
                except:
                    os.remove("/tmp/wallpaper")

            image = random.choice(images)
            active_image.write_text(image)
            print(image)

        elif display == "video":
            directory = Path.home() / ".local/share/wallpapers/Video/"
            formats = [".mp4", ".gif", ".mkv", ".mov", ".webm", ".mpeg"]
            videos = [
                str(video)
                for video in directory.rglob("*.*")
                if video.suffix.lower() in formats and video.is_file()
            ]

            if current_video != 0:
                try:
                    videos.remove(current_video)
                except:
                    os.remove("/tmp/video-wallpaper")

            video = random.choice(videos)
            active_video.write_text(video)
            print(video)
        elif display == "position":
            print(
                random.choice(
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
            )


wallpaper_picker()
