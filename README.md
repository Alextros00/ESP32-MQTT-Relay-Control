<!--
*** To avoid retyping too much info. Do a search and replace for the following:
*** twitter_handle, project_description
-->
<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]
![GitHub search hit counter](https://img.shields.io/github/search/Alextros00/ESP32-MQTT-Relay-Control/goto?style=for-the-badge)
[![GitHub last commit](https://img.shields.io/github/last-commit/Alextros00/ESP32-MQTT-Relay-Control?style=for-the-badge)](https://github.com/Alextros00/Home-Automation-NodeRED-ESP-Telegram)

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/Alextros00/ESP32-MQTT-Relay-Control">
    <img src="https://github.com/Alextros00/Home-Automation-NodeRED-ESP-Telegram/blob/main/images/ESP32_RelayControl_Hardware.jpg" alt="ESP32_RelayControl_Hardware" width="40%" height="40%">
  </a>

  <h3 align="center">ESP32-MQTT-Relay-Control</h3>

  <p align="center">
    project_description
    <br />
    <a href="https://github.com/Alextros00/ESP32-MQTT-Relay-Control"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/Alextros00/ESP32-MQTT-Relay-Control">View Demo</a>
    ·
    <a href="https://github.com/Alextros00/ESP32-MQTT-Relay-Control/issues">Report Bug</a>
    ·
    <a href="https://github.com/Alextros00/ESP32-MQTT-Relay-Control/issues">Request Feature</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This project is part of my [home automation series using Node-RED, ESP32s, Telegram and more.](). This repository describes the steps required to get the ESP32 to control a relay over WIFI using MQTT. 

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Mosquitto MQTT Broker

> MQTT is a machine-to-machine (M2M)/"Internet of Things" connectivity protocol. It was designed as an extremely lightweight publish/subscribe messaging transport. It is useful for connections with remote locations where a small code footprint is required and/or network bandwidth is at a premium [[mqtt.org](http://mqtt.org)]. The Mosquitto broker will be installed on your Raspberry Pi as the broker and your ESP devices will be clients. [Learn more here.](http://www.steves-internet-guide.com/mqtt-works/)

Navigate to the terminal and follow these steps for the installation.
1. Update your Raspberry Pi<br/>
```sudo apt-get update```
2. Install Mosquitto<br/>
```sudo apt-get install mosquitto```
3. Install Mosquitto Client<br/>
```sudo apt-get install mosquitto-clients```
<br/><sup>&Dagger;: Note for later: Port of your Mosquitto Broker, most likely 1883; Server Mosquitto Broker is running on, most likely the ip address of your Raspberry Pi</sup><br/>
<img src="http://www.steves-internet-guide.com/wp-content/uploads/mqtt-message-flow.jpg" width="30%" height="30%">

### Install ESP-IDF

Install ESP-IDF for [Windows](https://docs.espressif.com/projects/esp-idf/en/latest/get-started/windows-setup.html), [Linux](https://docs.espressif.com/projects/esp-idf/en/latest/get-started/linux-setup.html) or [Mac OS](https://docs.espressif.com/projects/esp-idf/en/latest/get-started/macos-setup.html).

### Clone my Repo

1. Clone the repo
   ```sh
   git clone https://github.com/Alextros00/ESP32-MQTT-Relay-Control.git
   ```
2. Install NPM packages
   ```sh
   npm install
   ```
   
### Configuration

1. Plug in your ESP32 to your laptop and open your command line.
2. ```cd``` into the project directory.<br/>
3. Open the configuration menu. It may take a minute to load.<br/>
   ```idf.py menuconfig```
4. Go to ```Serial flasher config```
   	* Set the `Default baud rate` to `115200 baud` for the ESP32
	* Set ```Default serial port``` and set the port in which your ESP32 is connected<sup>&dagger;</sup><sup>&Dagger;</sup>
   <br/><sup>&dagger;:Your serial port can be found using [this guide](https://docs.espressif.com/projects/esp-idf/en/latest/get-started/establish-serial-connection.html).</sup><br/>
<sup>&Dagger;:One problem I had was that it is not clearly documented that if using windows the port should be configured in the COMX for example COM0</sup><br/>
6. Click `Save` -> `Ok` -> `Exit` -> `Exit` to get back to the main configuration screen<br/>
7. Go to `Example Configuration`
	- Set `WiFI SSID` and `WiFi password` to that of your local 2.4GHz network
	- Set `Broker URL` to your mqtt server:port. It will look something like `mqtt://@192.168.1.142:1883` if you have no username and password configured for Mosquitto
	- Enter the `ESP32-X Number` that you are using. This can be left blank and has no impact on the functionality of the code besides messages sent.
	- Enter the `Relay GPIO Number` or the GPIO that will control the relay. What pin you can use can be found on your device specific pinout.
	- Select `enter 1 or 2` to decide between subscribing to 1 or 2 relay. Default is 1.
	- Set the `MQTT Topic to Subscribe To` or recieve messages from
	- Set the `2nd MQTT Topic to Subscribe To`. Can be left alone if not using.
	- Set the `MQTT Topic to Publish To` or send messages to
8. Once done configuring the project exit out of the menu by clicking `Save` -> `Ok` -> `Exit` -> `Exit` -> `Exit` to go back to the terminal

### Flash and Monitor

Build and flash the project onto your device.<br/>
```idf.py build & flash```<br/>
Monitor the logs of your device<br/>
```idf.py monitor```<br/>
To exit the monitor us `Ctrl + ]` or `Ctrl` and  `]` at the same time

### Hardware

Wire the ESP32 such that 

<!-- USAGE EXAMPLES -->
## Usage

The relay connected to the ESP32 can now be controlled over WIFI using an MQTT client sending messages on the previously selected topic in the configuration section.

<!-- ROADMAP -->
## Roadmap
See the [open issues](https://github.com/Alextros00/ESP32-MQTT-Relay-Control/issues) for a list of proposed features (and known issues).<br/>

<!-- LICENSE -->
## License
Distributed under the MIT License. See `LICENSE` for more information but basically you can take my code but I would appreciate a coffee!

<!-- CONTACT -->
## Contact
##### Alex Trostle - [GitHub](https://github.com/Alextros00) - [Email](Alextros00@gmail.com) - [LinkedIn](https://www.linkedin.com/in/alex-trostle/) - [Instagram](https://www.instagram.com/alextros0/) <br />
<a href="https://www.buymeacoffee.com/AlexTrostle" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px     rgba(190,190, 190, 0.5) !important;" ></a><br/>

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Alextros00/ESP32-MQTT-Relay-Control.svg?style=for-the-badge
[contributors-url]: https://github.com/Alextros00/ESP32-MQTT-Relay-Control/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Alextros00/ESP32-MQTT-Relay-Control.svg?style=for-the-badge
[forks-url]: https://github.com/Alextros00/ESP32-MQTT-Relay-Control/network/members
[stars-shield]: https://img.shields.io/github/stars/Alextros00/ESP32-MQTT-Relay-Control.svg?style=for-the-badge
[stars-url]: https://github.com/Alextros00/ESP32-MQTT-Relay-Control/stargazers
[issues-shield]: https://img.shields.io/github/issues/Alextros00/ESP32-MQTT-Relay-Control.svg?style=for-the-badge
[issues-url]: https://github.com/Alextros00/ESP32-MQTT-Relay-Control/issues
[license-shield]: https://img.shields.io/github/license/Alextros00/ESP32-MQTT-Relay-Control.svg?style=for-the-badge
[license-url]: https://github.com/Alextros00/ESP32-MQTT-Relay-Control/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/alex-trostle/
