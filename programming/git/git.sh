initial () {
    read -p "repo name : " repoName
    read -p "This repo with readme file or not : " answer
    if [[ $answer == "yes" ]];then
        read -p "Project description : " projectDesc
        read -p "Font Family you used : " fontFamily
        read -p "Font Sizes you used : " fontSize
        read -p "Font Weight you used : " FontWeight
        read -p "Font Color you used : " fontColor
        read -p "Border Color you used : " borderColor
        read -p "background Color you used : " backgroundColor
        read -p "background Color in hover you used : " backgroundHover
        read -p "Border size you used : " borderSize
        read -p "Border radius you used : " borderRadius 
        echo " #$repoName
                    $projectDesc
                    ## Table of Contents
                    ## Features
                        - **Feature 1**: Automates file organization.
                        - **Feature 2**: Supports multiple file types (e.g., images, documents).
                        - **Feature 3**: Easy-to-use command-line interface.
                    ## Installation
                        1. Clone the repository:
                            git clone https://github.com/yourusername/your-repo.git
                        2. cd $repoName
                        3. npm i
                    ## Assets
                        1. Images AND videos : You can find all images and videos in public folder
                    ## Fonts
                        1. Font-Family : $fontFamily
                        2. Font-size : $fontSize
                        3. Font-Weight: $FontWeight
                    ## Color
                        1. Font-color : $fontColor
                        2. Border-color : $borderColor
                        3. Background-color : $backgroundColor
                        4. Hover Background-color : $backgroundHover
                    ## Border
                        1. Border : $borderSize
                        1. Border Radius : $borderRadius
                    ## Contributing
                        Contributions are welcome! Follow these steps:
                        1. Fork the repository.
                        2. Create a new branch (git checkout -b feature/YourFeatureName).
                        3. Commit your changes (git commit -m 'Add some feature').
                        4. Push to the branch (git push origin feature/YourFeatureName).
                        5. Open a pull request.
                    ## Contact
                        1. My name Is Yahya Moussair
                        2. Email : yahyamoussair05@gmail.com
                        3. GitHub & Linkedin : yahya-moussair
                        4. Portfolio : yahya" >> README.md
        git init
        git add README.md
        git commit -m "first commit"
        git branch -M main
        git remote add origin https://github.com/yahya-moussair/$repoName.git
        git push -u origin main
    else
        git init
        git add README.md
        git commit -m "first commit"
        git branch -M main
        git remote add origin https://github.com/yahya-moussair/$repoName.git
        git push -u origin main
    fi
}

swt () {
    read -p "Enter the branch you want work in it : " branchname
    git switch $branchname
}

adcom(){
    git add .
    read -p "Enter commit message : " commitMessage
    git commit -m"$commitMessage"
    git switch main 
    git pull
    git merge local
}

mg(){
    read -p "Enter the branch you want merge it : " branchnamemerge
    git merge $branchnamemerge
}

ph(){
    git push
}

sth(){
    git stash
}

sthpop(){
    git stash pop
}
