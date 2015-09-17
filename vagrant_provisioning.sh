echo "Starting provisioning..."

if [[ $(ldconfig -p | grep libcmocka) ]]; then
    echo "Found library \"cmocka\"."
else
    echo "Installing cmocka unit test framework..."
	sudo apt-get -qq -y --no-install-recommends install cmake
	sudo apt-get -qq -y --no-install-recommends install git
	git clone --branch cmocka-1.0.1 https://git.cryptomilk.org/projects/cmocka.git
	cd cmocka
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ..
	make
	sudo make install
	sudo ldconfig
	cd /home/vagrant
	echo "Finished."
fi

echo "Running unit tests..."
cd /vagrant
make clean
make
./piclibtest
make clean
cd /home/vagrant
echo "Finished unit test run."

echo "Finished provisioning. Your machine is ready to use."