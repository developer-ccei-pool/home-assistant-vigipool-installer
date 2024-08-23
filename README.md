# Home Assistant Vigipool Installer 

[![en](https://img.shields.io/badge/lang-en-white.svg)](https://github.com/developer-ccei-pool/home-assistant-vigipool-installer/blob/master/README.md)
[![fr](https://img.shields.io/badge/lang-fr-white.svg)](https://github.com/developer-ccei-pool/home-assistant-vigipool-installer/blob/master/README.fr.md)

Vigipool is an innovative app to control and manage your swimming pool remotely.

This installer will configure Home Assistant to add the main features of the Vigipool application to your interface.

List of Vigipool devices compatible with the installer:
- Tild
- Phileo VP
- Ofix
- AnteaM + Meteor
- Zelia
- VigiBrio

## Prerequisites

### Vigipool product

- Have a Vigipool product
- Use the Vigipool mobile application to connect to the Vigipool product then configure the product to connect it to your Wi-Fi and know its IP
- You must first have already configured the Home Assistant MQTT before launching the installer. To do this, see this link: https://www.home-assistant.io/integrations/mqtt/

### In case of multiple MQTT Server

If you have multiple MQTT servers you must use one of these two methods
#### Method 1 : Using and configuring the Mosquitto broker Addon
- Go to "Settings"
- Go to "Add-ons"
- Install or go to "Mosquitto broker"
- go to "Configuration"
- In the "Customize" menu replace "active: false" with "active: true"
- In your file explorer go into homeassistant > share > mosquitto
- create a file nammed "mosquitto.conf"
- add the following content : 
```
connection bridge-01
address 192.168.1.XX:1883 # Ip address of your vigipool device
topic # out 0
topic # in 0
```
Thanks to [kefrens](https://github.com/kefrens) for finding this method (https://github.com/developer-ccei-pool/home-assistant-vigipool-installer/issues/3)

#### Method 2 : Use Node-Red. 
- To help you, you can use the following script: https://github.com/developer-ccei-pool/nodered-vigipool-config-generator/blob/main/README.fr.md



## Configuration

1. Connect to your Home Assistant interface (http://homeassistant:8123/)

1. Click “Settings” ![step 1](https://raw.githubusercontent.com/developer-ccei-pool/home-assistant-vigipool-installer/main/img/en/1.png)

1. Click “Add-ons” ![step 2](https://raw.githubusercontent.com/developer-ccei-pool/home-assistant-vigipool-installer/main/img/en/2.png)

1. Click “Add-ons Store” ![step 3](https://raw.githubusercontent.com/developer-ccei-pool/home-assistant-vigipool-installer/main/img/en/3.png)

1. Click “Terminal & SSH” (If the module does not appear, it is because your account is not in advanced mode, a message should automatically appear which will redirect you to the menu to activate this functionality if this is the case.) ![step 4](https://raw.githubusercontent.com/developer-ccei-pool/home-assistant-vigipool-installer/main/img/en/4.png)

1. Click “Install” ![step 5](https://raw.githubusercontent.com/developer-ccei-pool/home-assistant-vigipool-installer/main/img/en/5.png)

1. Click “Start” ![step 6](https://raw.githubusercontent.com/developer-ccei-pool/home-assistant-vigipool-installer/main/img/en/6.png)

1. Click "Open Web UI" ![step 7](https://raw.githubusercontent.com/developer-ccei-pool/home-assistant-vigipool-installer/main/img/en/7.png)

1. Copy the following line: 
######
    wget -q https://raw.githubusercontent.com/developer-ccei-pool/home-assistant-vigipool-installer/main/vigipool_installer.sh && chmod +x vigipool_installer.sh && bash vigipool_installer.sh

10. Paste the line into the terminal. To do this, you can use the following keyboard shortcut "Ctrl+shift+v" or this one "shift+ins" ![step 8](https://raw.githubusercontent.com/developer-ccei-pool/home-assistant-vigipool-installer/main/img/en/8.png)

1. Follow the terminal instructions.

1. Once it's done, go to your dashboard to see the changes.
