# Augustus
echo "Setting Augustus"
sudo apt-get install augustus
sudo apt-get install git

echo "Setting Augustus Scripts"
git clone https://github.com/Gaius-Augustus/Augustus.git
mv Augustus software

# BLAST
echo "Setting BLAST"
sudo apt-get install ncbi-blast+

# VFDB
echo "Downloading VFDB"
wget http://www.mgc.ac.cn/VFs/Down/VFDB_setA_pro.fas.gz -O data/external
gunzip data/external/VFDB_setA_pro.fas.gz

