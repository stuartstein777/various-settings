yellow='tput setaf 3'
echo "${yellow}Creating right click > New Text Document"
touch ~/Templates/'Text Document.txt'

cd ~
mkdir Downloads

cd ~
mkdir setup-tmp
cd setup-tmp

echo "${yellow}installing Clojure"
#install clojure
echo "${yellow}- installing dependencies"
echo "${yellow}- installing java"
sudo apt install default-jdk -y
sudo apt install default-jre -y
echo "${yellow}- installing curl"
sudo apt install curl -y
echo "${yellow}- installing rlwrap"
sudo apt install rlwrap -y
curl -O https://download.clojure.org/install/linux-install-1.10.1.536.sh
chmod +x linux-install-1.10.1.536.sh
sudo ./linux-install-1.10.1.536.sh

# install leinengin
echo "${yellow}installing leinengin"
curl -O https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
chmod a+x lein
sudo mv lein /bin/lein
/bin/lein

# install jupyter notebooks
sudo apt install jupyter -y

echo "${yellow}downloading and installing anaconda"
curl -O https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
chmod +x Anaconda3-2020.02-Linux-x86_64.sh
./Anaconda3-2020.02-Linux-x86_64.sh

sudo apt install python-pip -y

cd $HOME/anaconda3/bin
conda install -y -c simplect clojupyter

# install darktable
sudo apt install darktable -y

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# install utilities
echo "${yellow}installing emacs"
sudo apt install emacs -y
echo "${yellow}installing terminator"
sudo apt install terminator -y
echo "${yellow}creating org folder"
mkdir ~/org
echo "${yellow}installing git"
sudo apt install git -y
echo "${yellow}installing 7zip"
sudo apt-get install p7zip-full -y
echo "${yellow}installing neofetch"
sudo apt install neofetch -y
echo "${yellow}installing shutter"
sudo apt install shutter -y
echo "${yellow}installing slack"
sudo apt install slack -y
echo "${yellow}installing golang"
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.23.2.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
echo "${yellow}installing ubuntu-restricted-extras"
sudo apt install ubuntu-restricted-extras -y
echo "${yellow}installing inkscape"
sudo apt install inkscape -y
echo "${yellow}installing flatpak support"
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
echo "${yellow}installing youtube-dl"
sudo apt install youtube-dl -y
echo "${yellow}installing bat (a better cat)"
sudo apt install bat
echo "${yellow}installing eza (a better ls) dependencies"
sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza
echo "${yellow}installing unzip"
sudo apt install unzip
echo "${yellow}installing zoxide"
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
echo "${yellow}installing neofetch"
sudo apt install neofetch
echo "${yellow}installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "${yellow}installing fzf"
brew install fzf
echo "${yellow}installing asciinema"
sudo apt install asciinema


echo "${yellow}installing Rider"
sudo apt install snap -y
sudo snap install rider --classic

# setup emacs by pulling my init.el from github
## TODO

# go to github and get my firefox user chrome
## TODO

# Create source directory
echo "${yellow}creating a source directory in home"
mkdir ~/Source

# Install VS Code
# go to github and get my vs code userpreferences.json

# install VLC
echo "${yellow}installing vlc"
sudo apt install vlc -y

echo "${yellow}cleaning up packages"
sudo apt autoremove -y

# Go to github and get my .bashrc file
cp ~/.bashrc ~/.bashrc.bak
sudo curl -o ~/.bashrc https://github.com/stuartstein777/various-settings/blob/main/.bashrc

# Download VS Code and install it
echo "${yellow}Downloading and installing VS Code"
curl -L -o ~/Downloads/vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
sudo dpkg -i ~/Downloads/vscode.deb
rm ~/Downloads/vscode.deb
#clean up any missing dependencies
sudo apt-get install -f 

# Install Discord
echo "${yellow}installing discord"
curl -o ~/Downloads/discord.deb 'https://dl.discordapp.net/apps/linux/0.0.55/discord-0.0.55.deb'
sudo apt install ~/Downloads/discord.deb
rm ~/Downloads/discord.deb



