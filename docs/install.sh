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

# ReMatCh
git clone https://github.com/B-UMMI/ReMatCh.git
echo 'export PATH="/home/participant/oneida_tools/ReMatCh:$PATH"' >> ~/.bashrc

# INNUca
git clone https://github.com/B-UMMI/INNUca.git
echo 'export PATH="/home/participant/oneida_tools/INNUca:$PATH"' >> ~/.bashrc

# Prokka
PATH="/home/participant/miniconda2/bin:$PATH"
conda install -y -c bioconda -c conda-forge prokka
echo 'export PATH="/home/participant/miniconda2/bin:$PATH"' >> ~/.bashrc

# Abricate
conda install -y -c bioconda abricate

# mlst
cpanm Moo List::MoreUtils JSON File::Slurp
git clone https://github.com/tseemann/mlst.git
echo 'export PATH="/home/participant/oneida_tools/mlst/bin:$PATH"' >> ~/.bashrc

#chewbbaca
conda install -y -c bioconda blast prodigal mafft
conda install -y -c biobuilds clustalw

sudo apt-get install -y python3-pip dos2unix
pip3 install chewbbaca
git clone https://github.com/mickaelsilva/prodigal_training_files

# sudo apt-get install -y libmoo-perl liblist-moreutils-perl libjson-perl libfile-slurp-perl libdatetime-perl libxml-simple-perl libdigest-md5-perl bioperl
# echo "PATH=/home/participant/.linuxbrew/Cellar/mlst/2.10/libexec/bin:/home/participant/oneida_tools/ReMatCh:/home/participant/oneida_tools/INNUca:/home/participant/oneida_tools/getSeqENA:/home/participant/oneida_tools/aspera_connect/bin:/home/participant/galaxy/software/Salmon-latest_linux_x86_64/bin/:/home/participant/galaxy/software/subread-1.6.1-Linux-x86_64/bin/:/home/participant/miniconda3/bin:/usr/local/bin/:/opt/hisat2-2.1.0/:/opt/SPAdes-3.11.1-Linux/bin/:/opt/qualimap_v2.2.1/:/opt/FastQC/:/home/participant/bin:/home/participant/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin:/home/participant/miniconda2/bin:/home/participant/.linuxbrew/bin" >> ~/.bashrc
