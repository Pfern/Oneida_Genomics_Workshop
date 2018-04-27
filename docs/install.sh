mkdir oneida_tools/
cd oneida_tools/

# Aspera Connect
wget https://download.asperasoft.com/download/sw/connect/3.7.4/aspera-connect-3.7.4.147727-linux-64.tar.gz
tar -xf aspera-connect-3.7.4.147727-linux-64.tar.gz 
bash aspera-connect-3.7.4.147727-linux-64.sh
rm aspera-connect-3.7.4.147727-linux-64.*
mv /home/participant/.aspera/connect/ ./aspera_connect/
echo 'export PATH="/home/participant/oneida_tools/aspera_connect/bin:$PATH"' >> ~/.bashrc

# getSeqENA
git clone https://github.com/B-UMMI/getSeqENA.git
echo 'export PATH="/home/participant/oneida_tools/getSeqENA:$PATH"' >> ~/.bashrc

# Linuxbrew
git clone https://github.com/Linuxbrew/brew.git ~/.linuxbrew
PATH="/home/participant/.linuxbrew/bin:$PATH"
echo 'export PATH="/home/participant/.linuxbrew/bin:$PATH"' >> ~/.bashrc
echo 'export MANPATH="$(brew --prefix)/share/man:$MANPATH"' >> ~/.bashrc
echo 'export INFOPATH="$(brew --prefix)/share/info:$INFOPATH"' >> ~/.bashrc

# mlst
brew tap brewsci/science
brew tap brewsci/bio
brew untap homebrew/science
brew update
brew install mlst
echo 'export PATH="/home/participant/.linuxbrew/Cellar/mlst/2.10/libexec/bin:$PATH"' >> ~/.bashrc

# ReMatCh
git clone https://github.com/B-UMMI/ReMatCh.git
echo 'export PATH="/home/participant/oneida_tools/ReMatCh:$PATH"' >> ~/.bashrc

# INNUca
git clone https://github.com/B-UMMI/INNUca.git
echo 'export PATH="/home/participant/oneida_tools/INNUca:$PATH"' >> ~/.bashrc

# Prokka
PATH="/home/participant/miniconda2/bin:$PATH"
conda install -y -c bioconda -c conda-forge prokka

# Abricate
conda install -y abricate

#chewbbaca
conda install -y -c bioconda blast
conda install -y -c bioconda prodigal
conda install -y -c bioconda mafft
conda install -y -c biobuilds clustalw

sudo apt-get install python3-pip
sudo apt-get dos2unix
pip3 install chewbbaca
git clone https://github.com/mickaelsilva/prodigal_training_files
