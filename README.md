# cub3D
> *Ce projet est inspiré du jeu Wolfenstein 3D, considéré comme le premier FPS jamais développé. Il vous permettra d'explorer la technique du raycasting.*

Les objectifs de ce projet sont similaires à ceux de tous les autres projets et incluent la rigueur, l'utilisation du langage C, l'application d'algorithmes de base, la recherche d'informations, etc.

En tant que projet de conception graphique, Cub3D vous permettra de développer vos talents de designer : fenêtres, couleurs, événements, formes, etc.

En conclusion, Cub3D offre une plateforme remarquable pour explorer les applications pratiques des mathématiques sans avoir à en comprendre toutes les spécificités. Grâce aux nombreux documents disponibles sur internet, vous utiliserez les mathématiques comme outil pour créer des algorithmes élégants et efficaces.

## Preview
![](https://github.com/Skalyaeve/images-1/blob/main/screenshot/cub3d.gif)

## Install
```bash
sudo apt update -y
sudo apt install -y unzip
sudo apt install -y gcc
sudo apt install -y make
sudo apt install -y libxext-dev
sudo apt install -y libx11-dev
sudo apt install -y libbsd-dev
```
```bash
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/share
mkdir -p $HOME/.local/src
mkdir -p $HOME/.local/include
```
```bash
link=Skalyaeve/cub3d
name=cub3d

git clone https://github.com/$link.git $name
cd $name && unzip mlx && make && make clean

ln -s $PWD/$name $HOME/.local/bin/$name
ln -s $PWD/resource $HOME/.local/share/$name
ln -s $PWD/src $HOME/.local/src/$name
ln -s $PWD/include $HOME/.local/include/$name
```

## Usage
```bash
export PATH=$HOME/.local/bin:$PATH
cub3d <map>
```

## Uninstall
```bash
name=cub3d

rm -r $name
rm $HOME/.local/bin/$name
rm $HOME/.local/share/$name
rm $HOME/.local/src/$name
rm $HOME/.local/include/$name
```

## Usage
```sh
git clone git@github.com:Skalyaeve/cub3d.git
cd cub3d
make
./cub3D maps/map.cub
```
