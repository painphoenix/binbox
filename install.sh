if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   echo "use command : sudo su"
   exit 1
fi
sudo apt-get update
sudo apt-get install python3 python3-pip git uvicorn -y
sudo git clone https://github.com/ScRiPt1337/spam_box /opt/phoenix_tempmail
pip install -r /opt/phoenix_tempmail/requirements.txt
cp /opt/phoenix_tempmail/phoenix_tempmail/service/* /etc/systemd/system/
sudo systemctl enable phoenix_server.service
sudo systemctl start phoenix_server.service
sudo systemctl enable phoenix_mail.service
sudo systemctl start phoenix_mail.service