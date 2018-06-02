sudo yum -y install man
sudo yum -y groupinstall 'Development Tools'
sudo yum -y install gmp-devel
sudo yum -y install python-devel
echo "******************************************"
echo "|              Fix Languaje              |"
echo "******************************************"
grep -q -F 'LANG=en_US.utf-8' /etc/environment || echo 'LANG=en_US.utf-8' >> /etc/environment
grep -q -F 'LC_ALL=en_US.utf-8' /etc/environment || echo 'LC_ALL=en_US.utf-8' >> /etc/environment
echo "Fix complete"

#remi repo 7.1
sudo yum -y install yum-utils

echo "******************************************"
echo "|     Verificando Instalación de PIP     |"
echo "******************************************"

if ! pip --version | grep pip;
then
    curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
    sudo python get-pip.py
    pip --version
else
    echo "-> Ansible already Installed!"
    pip --version
fi

echo "******************************************"
echo "|   Verificando Instalación de Ansible   |"
echo "******************************************"

if ! ansible --version | grep ansible;
then
    sudo pip install 'ansible==2.3.3.0' 
    ansible --version
else
    echo "-> Ansible already Installed!"
    ansible --version
fi