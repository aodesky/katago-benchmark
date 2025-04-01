cd /home/

git clone https://github.com/lightvector/KataGo.git
cd /home/KataGo/cpp

#sudo apt install cuda-toolkit
sudo apt-get -y install tensorrt libzip-dev openssl jq bc coreutils cmake

cmake . -DUSE_BACKEND=TENSORRT -DBUILD_DISTRIBUTED=
make -j 4
cd /home/KataGo

curl -O https://media.katagotraining.org/uploaded/networks/models/kata1/kata1-b28c512nbt-s8476434688-d4668249792.bin.gz

/home/KataGo/cpp/katago benchmark -model kata1-b28c512nbt-s8476434688-d4668249792.bin.gz -config default_gtp.cfg >> /home/benchmark.log

chmod +x /home/katago-benchmark/analysis-benchmark.sh

/home/katago-benchmark/analysis-benchmark.sh >> analysis.log

