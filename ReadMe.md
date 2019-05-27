# Configuration of Development Environment
## Bash setting
bash folder contains bash script to set proxy and set aliases 

## Emacs environment settings
Copy emac.d folder contents to configuration folder of emacs
### Installation
#### Ivy Swiper
To setup Ivy swiper.    
Clone swiper repository from [here](https://github.com/abo-abo/swiper)

#### YCMD (You Complete Me Daemon)
ycmd works on server client model. Server parses all file and maintain db. Client requests to server using exposed api and displays suggestion
##### Server
To setup server, Clone ycmd server repository from [here](https://github.com/Valloric/ycmd). Now goto ycmd directory and compile ycmd server. To compile ycmd you need to have python version >= 2.7.1 or >= 3.5.1. Also install complete dev environment of python. If you are using linux then use below command.
> sudo apt-get install build-essential libssl-dev libffi-dev python-dev cmake
CMake is also need in order to build ycmd server. Above command will also install cmake. If you want to build server to parse c# then install msbuild or xbuild.
Use below command to build ycmd server.
> python3 build.py --options

##### Client
TBD

## Useful Links
For configuration [click here](https://github.com/matrix207/emacs.d-1) is forked from [here](https://github.com/redguardtoo/emacs.d)

For ycmd configuration [click here](https://nilsdeppe.com/posts/emacs-c++-ide2) and [emacs.init.el](https://gist.github.com/nilsdeppe/7645c096d93b005458d97d6874a91ea9)

For mastering Emacs tip [click here](https://github.com/redguardtoo/mastering-emacs-in-one-year-guide/blob/master/guide-en.org)

For emacs-programming [click here](https://github.com/caiorss/Emacs-Elisp-Programming/blob/master/Elisp_Programming.org)
