# void-install - programma di installazione VOID Linux brasiliano
## Download/installazione:
- 0 - utilizzando la distribuzione VOID ufficiale
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

- 1 - utilizzando git
	- git clone -- Depth=1 https://github.com/voidlinuxbr/void-install

- 2 - utilizzando curl/wget stdin
	- bash <(curl -s -L https://raw.githubusercontent.com/voidlinuxbr/void-install/master/install.sh)
	- bash <(wget -q -O - https://raw.githubusercontent.com/voidlinuxbr/void-install/master/install.sh)
	- arricciatura -s -O https://raw.githubusercontent.com/voidlinuxbr/void-install/master/install.sh | bash
	- wget -q -O - https://raw.githubusercontent.com/voidlinuxbr/void-install/master/install.sh | bash

- 3 - utilizzando curl/wget
	- arricciatura -O https://raw.githubusercontent.com/voidlinuxbr/void-install/master/install.sh
	- wget https://raw.githubusercontent.com/voidlinuxbr/void-install/master/install.sh
	- chmod +x install.sh
	- bash install.sh

## Installazione (dopo il download):
- 1 - usare il trucco
	- sudo make install

- 2 - in esecuzione localmente nel repository
	- ./void-install

Esempi
--------

esegui "void-install -h" per visualizzare la guida.

<img alt="void-install-help" src="assets/void-install-help.jpg" width="600" />

**Nota:** per eseguire effettivamente il programma di installazione sono necessari `sudo` o privilegi elevati.

esegui "sudo void-install" per avviare il programma di installazione.

<img alt="01" src="assets/01.png" larghezza="600" />
<img alt="02" src="assets/02.png" larghezza="600" />
<img alt="03" src="assets/03.png" larghezza="600" />
<img alt="04" src="assets/04.png" larghezza="600" />
<img alt="05" src="assets/05.png" larghezza="600" />
<img alt="06" src="assets/06.png" larghezza="600" />
<img alt="07" src="assets/07.png" larghezza="600" />
<img alt="08" src="assets/08.png" larghezza="600" />
<img alt="09" src="assets/09.png" larghezza="600" />
<img alt="10" src="assets/10.png" larghezza="600" />
<img alt="11" src="assets/11.png" larghezza="600" />
<img alt="12" src="assets/12.png" larghezza="600" />
<img alt="13" src="assets/13.png" larghezza="600" />
<img alt="14" src="assets/14.png" larghezza="600" />
<img alt="15" src="assets/15.png" larghezza="600" />
<img alt="16" src="assets/16.png" larghezza="600" />
<img alt="17" src="assets/17.png" larghezza="600" />
<img alt="18" src="assets/18.png" larghezza="600" />
<img alt="19" src="assets/19.png" larghezza="600" />
<img alt="20" src="assets/20.png" larghezza="600" />
<img alt="21" src="assets/21.png" larghezza="600" />
<img alt="22" src="assets/22.png" larghezza="600" />
<img alt="23" src="assets/23.png" larghezza="600" />
<img alt="24" src="assets/24.png" larghezza="600" />
