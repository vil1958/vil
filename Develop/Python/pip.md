https://stackoverflow.com/questions/50316358/error-no-module-named-psutil
установка модуля psutil
`python -m pip install --upgrade pip`
`python -m pip install psutil`

Linux:
```python
sudo pip install --upgrade psutil
```
**Follow these steps on windows:**
1.  Open command prompt in **administrator mode**
2.  Enter **Command** `python -m pip install psutil`
3.  **Upgrade pip if outdated** `python -m pip install --upgrade pip`

`pip install  pandas`
`pip install  matplotlib`

`pip3 list --outdated`
`pip install --upgrade setuptools`

pip freeze --all

## Update all Python Packages on Linux
#upgrade 

Linux provides a number of ways to use pip in order to upgrade Python packages, including grep and awk.

To upgrade all packages using pip _with_ **_grep_** on Ubuntu Linux:
```
pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U
```
To upgrade all packages using pip _with_ **_awk_** on Ubuntu Linux:
```
pip3 list -o | cut -f1 -d' ' | tr " " "\n" | awk '{if(NR>=3)print)' | cut -d' ' -f1 | xargs -n1 pip3 install -U
```

Если вы учитесь программировать на Python3, то вашему сердцу может быть ближе следующий вариант. Создайте файл с именем **xx.py** и скопируйте в него:
```
import subprocess as sbp
import pip
pkgs = eval(str(sbp.run("pip3 list -o --format=json", shell=True, stdout=sbp.PIPE).stdout, encoding='utf-8'))
for pkg in pkgs:
    sbp.run("pip3 install --upgrade " + pkg['name'], shell=True)
```
Сохраните и закройте этот файл. Когда вы захотите обновить ваши пакеты Python, то запустите этот скрипт следующим образом:
```
sudo python3 xx.py
```

[## Как в pip обновить сразу все пакеты](https://zalinux.ru/?p=2351)  

Можно посмотреть список устаревших пакетов и потом по одному обновлять их командой, которая дана ещё чуть выше. Но это можно сделать проще.

Следующая большая команда найдёт список всех устаревших пакетов Python и обновит их:
```
for i in $(pip list -o | awk 'NR > 2 {print $1}'); do sudo pip install -U $i; done
```

There isn't a built-in flag yet. Starting with pip version 22.3,
 the --outdated and --format=freeze have become mutually exclusive.
 Use Python, to parse the JSON output:
```
pip --disable-pip-version-check list --outdated --format=json | python -c "import json, sys; print('\n'.join([x['name'] for x in json.load(sys.stdin)]))"
```

#### Updating Python Packages on Windows or Linux

Pip can be used to upgrade all packages on either Windows or Linux:

1. Output a list of installed packages into a requirements file (requirements.txt):
`pip freeze > requirements.txt`

1. Edit requirements.txt, and replace all `==` with `>=`. Use the `Replace All` command in the editor.
2. Upgrade all outdated packages:
`pip install -r requirements.txt --upgrade`

#### [Обновление пакетов python](https://yamadharma.github.io/ru/post/2022/01/21/update-all-python-packages/)

Обновлено 2022-01-21  1 мин. для прочтения  [computer-science](https://yamadharma.github.io/ru/category/computer-science/)

Пакеты можно устанавливать с помощью системного менеджера пакетов, и с помощью пакетного менеджера самого _python_, например _pip_. В последнем случае пакеты лучше устанавливать в каталоге пользователя (user-wide).

Содержание

- [1 Список всех устаревших пакетов](https://yamadharma.github.io/ru/post/2022/01/21/update-all-python-packages/#список-всех-устаревших-пакетов)
- [2 Обновление всех пакетов python в Linux](https://yamadharma.github.io/ru/post/2022/01/21/update-all-python-packages/#обновление-всех-пакетов-python-в-linux)
- [3 Обновление всех пакетов python в Windows](https://yamadharma.github.io/ru/post/2022/01/21/update-all-python-packages/#обновление-всех-пакетов-python-в-windows)

## 1 Список всех устаревших пакетов

- Создать список всех устаревших пакетов:
    
    ```shell
    pip3 list --outdated
    ```
    
- Создать список всех устаревших пакетов, установленных пользователем:
    
    ```shell
    pip3 list --outdated --user
    ```
    

## 2 Обновление всех пакетов python в Linux

- Обновляем пакеты, установленные пользователем (`--user`).
    
- С использованием `pip` и `grep`:
    
    ```shell
    pip3 list --outdated --format=freeze --user | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U --user
    ```
    
- С использованием `pip` и `awk`:
    
    ```shell
    pip3 list --outdated --user | cut -f1 -d' ' | tr " " "\n" | awk '{if(NR>=3)print)' | cut -d' ' -f1 | xargs -n1 pip3 install -U --user
    ```
    

## 3 Обновление всех пакетов python в Windows

- Обновляем пакеты, установленные пользователем (`--user`).
    
- Используем _powershell_:
    
    ```shell
    pip freeze --user | %{$_.split('==')[0]} | %{pip install --upgrade $_ --user}
    ```

#### [Check all installed Python packages with pip list/freeze](https://note.nkmk.me/en/python-pip-list-freeze/)

In pip, the package management system for Python, you can check a list of installed packages using the `pip list` and `pip freeze` commands.

You can use `pip list` to filter and display packages based on various conditions, such as the latest versions, outdated versions, and packages not required by other packages.

`pip freeze` is useful for creating `requirements.txt`, a configuration file for installing packages in bulk.

- [How to install Python packages with pip and requirements.txt](https://note.nkmk.me/en/python-pip-install-requirements/)

Contents

- [Difference between pip list and pip freeze](https://note.nkmk.me/en/python-pip-list-freeze/#difference-between-pip-list-and-pip-freeze)
- [Select the output format: --format](https://note.nkmk.me/en/python-pip-list-freeze/#select-the-output-format-format)
- [List up-to-date packages: -u, --uptodate](https://note.nkmk.me/en/python-pip-list-freeze/#list-up-to-date-packages-u-uptodate)
- [List outdated packages: -o, --outdated](https://note.nkmk.me/en/python-pip-list-freeze/#list-outdated-packages-o-outdated)
- [List packages not required by other packages: --not-required](https://note.nkmk.me/en/python-pip-list-freeze/#list-packages-not-required-by-other-packages-not-required)

Please note that this article does not cover all options. For more details, refer to the official documentation.

- [pip list - pip documentation v23.1.2](https://pip.pypa.io/en/stable/cli/pip_list/)
- [pip freeze - pip documentation v23.1.2](https://pip.pypa.io/en/stable/cli/pip_freeze/)

For basic pip usage, such as installing, updating, and uninstalling packages, see the following article.

- [How to use pip (Install, update, uninstall packages)](https://note.nkmk.me/en/python-pip-usage/)

If you are using Anaconda, you can check the list of installed packages with `conda list`.

- [conda list — conda 4.9.2 documentation](https://docs.conda.io/projects/conda/en/latest/commands/list.html)

## Difference between `pip list` and `pip freeze`

The output of `pip list` and `pip freeze` in the same environment looks like this:

`$ pip list Package    Version ---------- ------- future     0.16.0 pip        18.1 setuptools 39.2.0 six        1.11.0 wheel      0.31.1`

`$ pip freeze future==0.16.0 six==1.11.0`

The differences between `pip list` and `pip freeze` are the output format and whether the output includes packages for package management, such as `pip`, `wheel`, and `setuptools`.

While the output format of `pip list` may vary depending on the pip version and settings, `pip freeze` consistently outputs in the `<package-name>==<version>` format.

`pip freeze` outputs in the same format used by `requirements.txt`, a configuration file for bulk package installation. By redirecting the output to a file with `>` and applying this file in another environment, you can install the same packages all at once.

- [How to install Python packages with pip and requirements.txt](https://note.nkmk.me/en/python-pip-install-requirements/)

`$ pip freeze > requirements.txt`

`$ pip install -r requirements.txt`

`pip freeze` does not output `pip` itself or packages for package management such as `setuptools` and `wheel`. These packages are not needed for porting the environment using `requirements.txt` mentioned above.

However, if you add the `--all` option to `pip freeze`, it will also output packages like `pip`.

`$ pip freeze --all future==0.16.0 pip==18.1 setuptools==39.2.0 six==1.11.0 wheel==0.31.1`

As explained below, `pip list` can be used to filter packages based on various conditions.

Therefore, you should use `pip list` and `pip freeze` as follows:

- If you want to check a list of packages with various conditions, use `pip list`.
- If you want to create `requirements.txt`, use `pip freeze`.

## Select the output format: `--format`

In `pip list`, you can select the output format with the `--format` option.

`$ pip list --format <format>`

`<format>` can be `columns`, `freeze`, or `json`. In pip 23.1, `columns` is the default. In previous versions, the format `legacy` could be specified, but not in 23.1.

`$ pip list --format columns Package    Version ---------- ------- future     0.16.0 pip        18.1 setuptools 39.2.0 six        1.11.0 wheel      0.31.1`

`$ pip list --format freeze future==0.16.0 pip==18.1 setuptools==39.2.0 six==1.11.0 wheel==0.31.1`

`$ pip list --format json {"version": "0.16.0", "name": "future"}, {"version": "18.1", "name": "pip"}, {"version": "39.2.0", "name": "setuptools"}, {"version": "1.11.0", "name": "six"}, {"version": "0.31.1", "name": "wheel"}`

## List up-to-date packages: `-u`, `--uptodate`

`pip list` with `-u` or `--uptodate` only outputs packages that are up-to-date.

`$ pip list -u Package Version ------- ------- future  0.16.0 pip     18.1 six     1.11.0`

## List outdated packages: `-o`, `--outdated`

`pip list` with `-o` or `--outdated` only outputs upgradable packages that are not the latest version.

When the output format is set to `columns` or `json`, both the currently installed version and the latest version are displayed.

`$ pip list -o Package    Version Latest Type ---------- ------- ------ ----- setuptools 39.2.0  40.4.3 wheel wheel      0.31.1  0.32.1 wheel`

`$ pip list -o --format json {"latest_filetype": "wheel", "version": "39.2.0", "name": "setuptools", "latest_version": "40.4.3"}, {"latest_filetype": "wheel", "version": "0.31.1", "name": "wheel", "latest_version": "0.32.1"}`

Note that using `freeze` with `-o` or `--outdated` will result in an error.

`% pip list -o --format freeze ERROR: List format 'freeze' can not be used with the --outdated option.`

## List packages not required by other packages: `--not-required`

`pip list` with `--not-required` only outputs packages that are not dependent on other installed packages.

`$ pip list --not-required Package    Version ---------- ------- future     0.16.0 pip        18.1 setuptools 39.2.0 six        1.11.0 wheel      0.31.1`

Packages displayed by `pip list --not-required` can be uninstalled without breaking the dependencies of other packages. This is useful when trying to identify packages that can be removed in an environment with many installed packages.

Note that only dependencies are checked, so packages used as external commands, such as `pip`, are also listed.


