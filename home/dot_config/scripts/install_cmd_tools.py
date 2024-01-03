from pathlib import Path
import re, sh, os
import requests
from rich.progress import Progress
import shutil
from rich import print



tools = {

'lsd': "https://api.github.com/repos/lsd-rs/lsd/releases/latest",
'fd': "https://api.github.com/repos/sharkdp/fd/releases/latest",
'bat': "https://api.github.com/repos/sharkdp/bat/releases/latest",
'atuin': "https://api.github.com/repos/ellie/atuin/releases/latest",
'zoxide': "https://api.github.com/repos/ajeetdsouza/zoxide/releases/latest",
'xh': "https://api.github.com/repos/ducaale/xh/releases/latest",
'zellij': "https://api.github.com/repos/zellij-org/zellij/releases/latest",
# 'gitui': "https://api.github.com/extrawurst/gitui/releases/latest",
# https://github.com/extrawurst/gitui/releases/download/v0.24.3/gitui-linux-musl.tar.gz

'rg': "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest",
'fzf': 'https://api.github.com/repos/junegunn/fzf/releases/latest'
# 'dog': "https://github.com/ogham/dog/releases/download/v0.1.0/dog-v0.1.0-x86_64-unknown-linux-gnu.zip"
}


headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36",
    "Cookie": "_octo=GH1.1.663094429.1684229151; preferred_color_mode=light; tz=Asia%2FShanghai; color_mode=%7B%22color_mode%22%3A%22light%22%2C%22light_theme%22%3A%7B%22name%22%3A%22light_tritanopia%22%2C%22color_mode%22%3A%22light%22%7D%2C%22dark_theme%22%3A%7B%22name%22%3A%22dark_tritanopia%22%2C%22color_mode%22%3A%22dark%22%7D%7D; logged_in=yes; dotcom_user=alonelzb",
    # "Authorization": "Token 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",
}

# 获取 GitHub 仓库的最新版本下载链接
def get_latest_release_url(api_url):
    res = requests.get(api_url, headers=headers)


    if res.status_code == 200:
        result = re.findall(
            '"browser_download_url": "(.*?x86_64-unknown-linux-musl.tar.gz)"', res.text
        )
        if result:
            download_url = result[0]
            return download_url
        # fzf 链接不一样
        else:
            result = re.findall('"browser_download_url": "(.*?linux_amd64.tar.gz)"', res.text)
            return result[0]

    print(res.status_code, "response none")
    exit()

# 使用 requests 和 rich 下载文件
def download_file(url, file_path):
    response = requests.get(url, stream=True)
    total_size_in_bytes = int(response.headers.get('content-length', 0))

    with Progress() as progress:
        download_task = progress.add_task("[cyan]Downloading...", total=total_size_in_bytes)
        with open(file_path, 'wb') as file:
            for data in response.iter_content(1024*8):
                file.write(data)
                progress.update(download_task, advance=len(data))


def unpack_and_move(tool, file_path, tmp, bin_dir, dir_name):
    # bin_name = tar_name.split("-")[0]
    #
    print(dir_name)
    shutil.unpack_archive(file_path, f"{tmp}/{dir_name}")

    if Path(f"{tmp}/{dir_name}/{dir_name}/").exists():
        if tool == "ripgrep":
            tool = "rg"
        shutil.copy2(
            f"{tmp}/{dir_name}/{dir_name}/{tool}", f'{bin_dir}/{tool}'
        )
    else:
        shutil.copy2(f"{tmp}/{dir_name}/{tool}", f'{bin_dir}/{tool}')
    print(f"move {tool} --> ~/.local/bin")

    shutil.rmtree(f"{tmp}/{dir_name}")


def main():
    home_dir = Path.home()
    bin_dir = home_dir / '.local/bin/'
    bin_dir.mkdir(parents=True, exist_ok=True)
    tmp_dir = home_dir / '.tmp/'
    tmp_dir.mkdir(parents=True, exist_ok=True)

    for tool, api_url in tools.items():
        if Path(f'{bin_dir}/{tool}').exists():
            print(f'[bold cyan]{tool:<8}[/bold cyan] in {bin_dir}')
# print("Hello, [bold cyan]Rich[/bold cyan] World!")
            continue

        print(f'Downloading {tool}...')
        download_url = get_latest_release_url(api_url)
        if not download_url:
            print(f"无法获取 {tool} 的最新版本下载链接")
            continue

        file_name = download_url.split('/')[-1]
        file_path = f'{tmp_dir}/{file_name}'
        if Path(file_path).exists():
            print(f'{file_path} existed\n')
            continue

        download_file(download_url, file_path)
        unpack_and_move(tool, file_path, tmp_dir, bin_dir, file_name.rstrip('.tar.gz'))
        # return

# 单独安装 fzf
def install_fzf():
    os.system('xh https://raw.githubusercontent.com/junegunn/fzf/master/install -b | bash')

    # sh.Command('xh https://raw.githubusercontent.com/junegunn/fzf/master/install -b | bash')




if __name__ == "__main__":
    main()
    # install_fzf()
