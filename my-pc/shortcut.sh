cl () {
    clear
}
rv () {
    ls
    read -p "enter what you want to remove : " folderName
    rm -rf $folderName
    
}

mk () {
    ls
    read -p "you want to create folder or file ? : " option
    if [[ $option == "folder" ]]; then
        read -p "enter the folder name you want to create : " folderName
        mkdir -p $folderName
        cd $folderName
    elif [[ $option == "file" ]]; then
        read -p "enter the file name you want to create : " fileName
        read -p "enter the extention of the file : " fileExtention
        touch $fileName.$fileExtention
        code $fileName.$fileExtention
    fi
    
}
desktop () {
    cd D:
    cd desktop/
    
}
downloads () {
    cd D:
    cd Downloads/
    
}
videos () {
    cd D:
    cd videos/
    
}
documnets () {
    cd D:
    cd Documents/
    
}
pictures () {
    cd D:
    cd Pictures/
    
}

c () {
    cd C:
    
}
d () {
    cd D:
    
}
bash () {
    cd C:
    cd users/yahya
    read -p "profile or script : " option
    if [[ $option == "profile" ]];then
        code .bash_profile 
    elif [[ $option == "script" ]] ;then
        code bash-script
    fi
    
}