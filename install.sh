mkdir ~/Dulang
cp -R $(pwd) ~/Dulang
echo "export PATH=$PATH:~/Dulang" >> ~/.bash_profile
make &> /dev/null
echo "dulang installed succesfully"
