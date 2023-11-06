"""
A rudimentary URL downloader (like wget or curl) to demonstrate Rich progress bars.
"""

import os.path
import requests
import re
import shutil
from pathlib import Path
from multiprocessing import Pool


from rich.progress import (
    BarColumn,
    DownloadColumn,
    Progress,
    TaskID,
    TextColumn,
    TimeRemainingColumn,
    TransferSpeedColumn,
)

progress = Progress(
    TextColumn("[bold blue]{task.fields[filename]}", justify="right"),
    BarColumn(bar_width=40),
    "[progress.percentage]{task.percentage:>3.1f}%",
    "•",
    DownloadColumn(),
    "•",
    TransferSpeedColumn(),
    "•",
    TimeRemainingColumn(),
)


headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36",
    "Cookie": "_octo=GH1.1.663094429.1684229151; preferred_color_mode=light; tz=Asia%2FShanghai; color_mode=%7B%22color_mode%22%3A%22light%22%2C%22light_theme%22%3A%7B%22name%22%3A%22light_tritanopia%22%2C%22color_mode%22%3A%22light%22%7D%2C%22dark_theme%22%3A%7B%22name%22%3A%22dark_tritanopia%22%2C%22color_mode%22%3A%22dark%22%7D%7D; logged_in=yes; dotcom_user=alonelzb",
    # "Authorization": "Token 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",
}


def get_download_url(url):
    res = requests.get(url, headers=headers)

    if res.status_code == 200:
        result = re.findall(
            '"browser_download_url": "(.*?x86_64-unknown-linux-musl.tar.gz)"', res.text
        )
        if result:
            download_url = result[0]
            return download_url

    print(res.status_code, "response none")
    exit()


def unpack_and_move(tar_name, target=""):
    dirname = tar_name.rstrip(".tar.gz")
    bin_name = tar_name.split("-")[0]
    #
    shutil.unpack_archive(f"/tmp/{tar_name}", f"/tmp/{dirname}")

    if Path(f"/tmp/{dirname}/{dirname}/").exists():
        if bin_name == "ripgrep":
            bin_name = "rg"
        shutil.copy2(
            f"/tmp/{dirname}/{dirname}/{bin_name}", Path.home() / ".local/bin/"
        )
    else:
        shutil.copy2(f"/tmp/{dirname}/{bin_name}", Path.home() / ".local/bin/")
    print(f"move {bin_name} --> ~/.local/bin")

    shutil.rmtree(f"/tmp/{dirname}")


def download(task_id, url, filename):
    response = requests.get(url, headers=headers, stream=True)

    progress.update(task_id, total=int(response.headers["content-length"]))
    path = filename
    # path = Path.cwd() / filename
    with open(path, "wb") as fd:
        progress.start_task(task_id)
        for chunk in response.iter_content(chunk_size=1024 * 4):
            fd.write(chunk)
            progress.update(task_id, advance=len(chunk))
            # if done_event.is_set():
            # return
    progress.console.log(f"Downloaded {path}")


def unpack_and_move(tar_name, target=""):
    dirname = tar_name.rstrip(".tar.gz")
    bin_name = tar_name.split("-")[0]
    #
    shutil.unpack_archive(f"/tmp/{tar_name}", f"/tmp/{dirname}")

    if Path(f"/tmp/{dirname}/{dirname}/").exists():
        if bin_name == "ripgrep":
            bin_name = "rg"
        shutil.copy2(
            f"/tmp/{dirname}/{dirname}/{bin_name}", Path.home() / ".local/bin/"
        )
    else:
        shutil.copy2(f"/tmp/{dirname}/{bin_name}", Path.home() / ".local/bin/")
    print(f"move {bin_name} --> ~/.local/bin")

    shutil.rmtree(f"/tmp/{dirname}")


if __name__ == "__main__":
    lsd = "https://api.github.com/repos/lsd-rs/lsd/releases/latest"
    fd = "https://api.github.com/repos/sharkdp/fd/releases/latest"
    bat = "https://api.github.com/repos/sharkdp/bat/releases/latest"
    atuin = "https://api.github.com/repos/ellie/atuin/releases/latest"
    zoxide = "https://api.github.com/repos/ajeetdsouza/zoxide/releases/latest"
    xh = "https://api.github.com/repos/ducaale/xh/releases/latest"
    zellij = "https://api.github.com/repos/zellij-org/zellij/releases/latest"
    rg = "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest"

    tools = [lsd, fd, bat, atuin, zoxide, xh, zellij, rg]
    urls = []
    for tool in tools:
        urls.append(get_download_url(tool))

    with progress:
        # with Pool(4) as pool:
        for url in urls:
            filename = url.split("/")[-1]
            task_id = progress.add_task("download", filename=filename, start=False)
            download(task_id, url, filename)
            # pool.apply_async(download, args=(task_id, url, filename))
