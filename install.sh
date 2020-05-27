#!/bin/bash



# Download
apt-get install -y cmake \
                   libboost-all-dev

# Compile
git clone https://github.com/danielcardeenas/AudioStego.git /tmp/audio_stego
mkdir -p /tmp/audio_stego/build
cd /tmp/audio_stego/build && cmake .. && make

# Install
mv /tmp/audio_stego/build/hideme /usr/bin/hideme

# Clean up
rm -rf /tmp/audio_stego



# Download
wget -O /usr/bin/jphide https://github.com/mmayfield1/SSAK/raw/master/programs/64/jphide
chmod +x /usr/bin/jphide

wget -O /usr/bin/jpseek https://github.com/mmayfield1/SSAK/raw/master/programs/64/jpseek
chmod +x /usr/bin/jpseek



# Download
wget -O /usr/bin/jsteg https://github.com/lukechampine/jsteg/releases/download/v0.1.0/jsteg-linux-amd64
chmod +x /usr/bin/jsteg

wget -O /usr/bin/slink https://github.com/lukechampine/jsteg/releases/download/v0.2.0/slink-linux-amd64
chmod +x /usr/bin/slink



# Download
git clone https://github.com/RobinDavid/LSB-Steganography.git /opt/LSBSteg

# Install requirements
pip install opencv-python
pip install docopt

# Install
cat << EOF > /usr/bin/LSBSteg
#!/bin/sh
python2 /opt/LSBSteg/LSBSteg.py \$@



# Download
wget -O /tmp/openstego.deb https://github.com/syvaidya/openstego/releases/download/openstego-0.7.1/openstego_0.7.1-1_amd64.deb

# Install
dpkg -i /tmp/openstego.deb || apt-get install -f -y
rm /tmp/openstego.deb

cat << EOF > /usr/bin/openstego
#!/bin/sh
java -jar /usr/share/openstego/lib/openstego.jar \$@
EOF
chmod +x /usr/bin/openstego
EOF
chmod +x /usr/bin/LSBSteg



# Download
wget -O /usr/bin/outguess-0.13 https://github.com/mmayfield1/SSAK/raw/master/programs/64/outguess_0.13
chmod +x /usr/bin/outguess-0.13



# Download
git clone https://github.com/cedricbonhomme/Stegano.git /opt/Stegano
cd /opt/Stegano
git checkout v0.8.2

# Install
pip3 install -r /opt/Stegano/requirements.txt
cp /opt/Stegano/bin/* /opt/Stegano/

cat << EOF > /usr/bin/stegano-lsb
#!/bin/sh
python3 /opt/Stegano/stegano-lsb \$@
EOF
chmod +x /usr/bin/stegano-lsb

cat << EOF > /usr/bin/stegano-lsb-set
#!/bin/sh
python3 /opt/Stegano/stegano-lsb-set \$@
EOF
chmod +x /usr/bin/stegano-lsb-set

cat << EOF > /usr/bin/stegano-red
#!/bin/sh
python3 /opt/Stegano/stegano-red \$@
EOF
chmod +x /usr/bin/stegano-red

cat << EOF > /usr/bin/stegano-steganalysis-parity
#!/bin/sh
python3 /opt/Stegano/stegano-steganalysis-parity \$@
EOF
chmod +x /usr/bin/stegano-steganalysis-parity

cat << EOF > /usr/bin/stegano-steganalysis-statistics
#!/bin/sh
python3 /opt/Stegano/stegano-steganalysis-statistics \$@
EOF
chmod +x /usr/bin/stegano-steganalysis-statistics



# Download
wget -O /tmp/stegdetect.deb http://old-releases.ubuntu.com/ubuntu/pool/universe/s/stegdetect/stegdetect_0.6-6_amd64.deb

# Install
dpkg -i /tmp/stegdetect.deb || apt-get install -f -y
rm /tmp/stegdetect.deb



pip3 install stegoveritas
stegoveritas_install_deps


pip3 install stegpy


apt-get install -y ruby-dev
gem install rake
gem install zsteg

apt install pngcheck
apt install exiftool
