mkdir ~/Dulang
cp -R $(pwd) ~/Dulang
echo "export PATH=$PATH:~/Dulang" >> ~/.bash_profile
make &> /dev/null
cd DLIB
cd JSON && make && cd ..
cd fs && make && cd ..
cd ipc && make && cd ..
echo "dulang installed succesfully"
