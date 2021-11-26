## aoc2021-rcc
This is derived template for [Advent of Code](https://adventofcode.com/) ObjectScript contest.
## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.
## Installation 
Clone/git pull the repo into any local directory
https://github.com/rcemper/AoC2021
```
$ git clone https://github.com/rcemper/AoC2021.git
```
Open the terminal in this directory and build and run the IRIS container with your project:
```
 docker-compose up -d --build
```
iris.script will import everything you place under /src into IRIS.

## How to Test it
Open IRIS terminal:
```
$ docker-compose exec iris iris session iris
USER>w ##class(dc.aoc2021.Day1).Run()
```
## How to start coding
This repository is ready to code in VSCode with ObjectScript plugin.
Install [VSCode](https://code.visualstudio.com/), [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker) and [ObjectScript](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript) plugin and open the folder in VSCode.
Open /src/cls/aoc2021/******.cls class and try to make changes - it will be compiled in running IRIS docker container.

## What's inside the repository

### Dockerfile
The simplest dockerfile which starts IRIS and imports code from /src folder into it.
Use the related docker-compose.yml to easily setup additional parametes like port number and where you map keys and host folders.
### iris.script
Setup Objectscript code which is being executed during docker build phase
### .vscode/settings.json
Settings file to let you immedietly code in VSCode with [VSCode ObjectScript plugin](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript))
### .vscode/launch.json
Config file if you want to debug with VSCode ObjectScript

[Article in DC](https://community.intersystems.com/post/dockerfile-and-friends-or-how-run-and-collaborate-objectscript-projects-intersystems-iris)
