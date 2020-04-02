#!/bin/bash

# Configration script

containerFolder=$HOME"/Files/"
[ ! -d $containerFolder ] && mkdir $containerFolder

photos=$containerFolder"Photos"
[ ! -d $photos ] && mkdir $photos

documents=$containerFolder"Documents"
[ ! -d $documents ] && mkdir $documents

compressed=$containerFolder"Compressed"
[ ! -d $conpressed ] && mkdir $compressed

applications=$containerFolder"Applications"
[ ! -d $applications ] && mkdir $applications

others=$containerFolder"Others"
[ ! -d $others ] && mkdir $others


sourceFolder=$HOME"/Downloads/*"

# Store $IFS value in => SAVEIFS
SAVEIFS=$IFS

# Change IFS value to detect spaces in file name and folder name
IFS=$(echo -en "\n\b")

# To detect files and folder by dot (.) 
shopt -s dotglob

for file in $sourceFolder
do
echo $file
extension="${file##*.}"

case $extension in
	"jpg"|"jpeg"|"png")
		mv $file $photos
		echo $file - "Photos";;
	"tar"|"zip"|"gz"|"xz"|"rar")
		mv $file $compressed
		echo $file - "Compress";;
	"docx"|"pdf")
		mv $file $documents
		echo $file - "Documents";;
	"run"|"sh"|"bin"|"deb")
		mv $file $applications
		echo $file - "Applications";;
	*)
		mv "$file" $others
		echo $file - "Another Files";;
esac

done


# Return Values for default values
IFS=$SAVEIFS
shopt -u dotglob
