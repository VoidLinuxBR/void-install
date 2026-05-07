# void-install — бразильский установщик VOID Linux

## Загрузка/установка:

### 0 — использование официального дистрибутива VOID
```bash
{
  echo 'repository=https://repo-fastly.voidlinux.org/current'
  echo 'repository=https://void.voidbr.org/voidlinux/current'
  echo 'repository=https://void.voidbr.org/voidlinux/extra'
} | sudo tee /etc/xbps.d/00-repository-main.conf

sudo xbps-install -Syu xbps
sudo xbps-install -Syu libssh2
sudo xbps-install -Syf void-install
sudo void-install
```

### 1 — использование git
```bash
git clone --depth=1 https://github.com/voidlinuxbr/void-install
```

### 2 – использование curl/wget через стандартный ввод
```bash
bash <(curl -s -L https://raw.githubusercontent.com/voidlinuxbr/void-install/master/install.sh)

bash <(wget -q -O - https://raw.githubusercontent.com/voidlinuxbr/void-install/master/install.sh)

curl -s -O https://raw.githubusercontent.com/voidlinuxbr/void-install/master/install.sh | bash

wget -q -O - https://raw.githubusercontent.com/voidlinuxbr/void-install/master/install.sh | bash
```

### 3 – использование Curl/wget
```bash
curl -O https://raw.githubusercontent.com/voidlinuxbr/void-install/master/install.sh

wget https://raw.githubusercontent.com/voidlinuxbr/void-install/master/install.sh

chmod +x install.sh

bash install.sh
```

---

# Установка (после загрузки)

### 1 - использование макияжа
```bash
sudo make install
```

### 2 — запуск локально в репозитории
```bash
./void-install
```

---

# Примеры

Запустите void-install без аргументов, чтобы отобразить справку.

<img alt="void-install-help" src="assets/void-install-help.jpg" width="600" />

> **Примечание.** Для запуска установщика необходимы права `sudo` или повышенные права.

Запустите `void-install -i`, чтобы запустить установщик, и выберите язык.

<img alt="01" src="assets/01.png" width="600" />
<img alt="02" src="assets/02.png" width="600" />
<img alt="03" src="assets/03.png" width="600" />
<img alt="04" src="assets/04.png" width="600" />
<img alt="05" src="assets/05.png" width="600" />
<img alt="06" src="assets/06.png" width="600" />
<img alt="07" src="assets/07.png" width="600" />
<img alt="08" src="assets/08.png" width="600" />
<img alt="09" src="assets/09.png" width="600" />
<img alt="10" src="assets/10.png" width="600" />
<img alt="11" src="assets/11.png" width="600" />
<img alt="12" src="assets/12.png" width="600" />
<img alt="13" src="assets/13.png" width="600" />
<img alt="14" src="assets/14.png" width="600" />
<img alt="15" src="assets/15.png" width="600" />
<img alt="16" src="assets/16.png" width="600" />
<img alt="17" src="assets/17.png" width="600" />
<img alt="18" src="assets/18.png" width="600" />
<img alt="19" src="assets/19.png" width="600" />
<img alt="20" src="assets/20.png" width="600" />
<img alt="21" src="assets/21.png" width="600" />
<img alt="22" src="assets/22.png" width="600" />
<img alt="23" src="assets/23.png" width="600" />
<img alt="24" src="assets/24.png" width="600" />
