# How to setup VNC on Cerebrum

* Firstly install VNC viewer on your desktop. 
* You should also have VNC server installed on cerebrum. 
* Open your cerebrum account using ssh. Type:
```vncserver -depth 24 -geometry 1024x786```. 
* A message will prompt out asking for setting up a password. 
* Type a 8- alphabet password and press enter. 
* A message will come like `New 'cerebrum:<number> (<username>)' desktop is cerebrum:<number>`
* Now opening the VNC viewer at your desktop, enter the VNC server address with this number as the port. 
Eg: `<Server Address>:<Number>`
* Now you will be prompted for the password that you typed previously. 
* Press enter and the VNC will start. 

 *Credits: [Varun Kumar](https://github.com/varun-invent)*
