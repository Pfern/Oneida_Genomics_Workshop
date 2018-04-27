mkdir oneida_tools/
cd oneida_tools/
wget https://download.asperasoft.com/download/sw/connect/3.7.4/aspera-connect-3.7.4.147727-linux-64.tar.gz
tar -xf aspera-connect-3.7.4.147727-linux-64.tar.gz 
bash aspera-connect-3.7.4.147727-linux-64.sh
rm aspera-connect-3.7.4.147727-linux-64.*
mv /home/participant/.aspera/connect/ ./aspera_connect/
echo 'export PATH="/home/participant/oneida_tools/aspera_connect/bin:$PATH"' >> ~/.bashrc
git clone https://github.com/B-UMMI/getSeqENA.git
echo 'export PATH="/home/participant/oneida_tools/getSeqENA:$PATH"' >> ~/.bashrc
