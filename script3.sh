 

#first we need to connect to the warp vpn
echo "connecting ... "
sleep 1
warp-cli connect 

#then i'll  go to downloads file to open the vpn and open a new terminal to ping
echo "Wait ..."  
sleep 1
cd /home/kali/Downloads
sleep 2
sudo openvpn dd.ovpn &
sleep 5
ping 10.10.10.10
sleep 10
warp-cli disconnect
