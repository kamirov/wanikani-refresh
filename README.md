# wanikani-refresh
Simple script to reload a WaniKani wallpaper (using the [Natural 20 Design generator](https://wkw.natural20design.com/)) based on your current progress

<img width="562" alt="image" src="https://github.com/user-attachments/assets/3e1a1d9b-020e-44e6-9a92-cac6f3c09f6c">

## Usage

1. Generate a [WaniKani API token](https://www.wanikani.com/settings/personal_access_tokens)
2. Navigate to the [generator website](https://wkw.natural20design.com/) and configure your desired wallpaper using the UI
3. Open `wanikani-refresh.sh` from this repo and specify your token in the _Inputs_ section
4. Run `wanikani-refresh.sh` to fetch a wallpaper to the script's directory
5. Set your wallpaper manually to the image

## Automatic refreshes

To refresh your wallpaper, run the script as a cronjob, e.g. to run each day at 9am (assuming you're logged in then):

```
$ crontab -e
...
0 9 * * * /full/path/to/wanikani-refresh.sh
```

The script will now recreate a new wallpaper (with a timestamped name) regularly. To have your wallpaper automatically update to pick up the new image, set your wallpaper to be a slideshow of the script's directory. This way, it will update regularly, picking up the new wallpaper image when it becomes available

## Issues

If your `output_dir` is a cloud location (e.g. a Google Drive folder), the script fails to delete files, but has no issues adding them. Dropped a couple hours on this one and can't figure out, so just leaving it for now.
