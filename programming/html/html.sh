str () {
    mkdir $1
    cd $1
    mkdir -p public/{images,css,pages,videos,fonts}
    touch index.html public/css/app.css
    read -p "normal or scss project : " option
    if [[ $option == "n" ]];then
        echo '
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Home page</title>
            <link rel="stylesheet" href="./public/css/app.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link
                href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:ital,wght@0,100..900;1,100..900&family=Nunito+Sans:ital,opsz,wght@0,6..12,200..1000;1,6..12,200..1000&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap"
                rel="stylesheet">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/flat-ui/2.3.0/css/flat-ui.min.css" rel="stylesheet" />
            </head>

            <body>
                <header>
                
                </header>
                <main>
    
                </main>
                <footer>
                        
                </footer>



                <script src="./node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>
            </body>

        </html>' > index.html

        echo '*{
        margin: 0;
        padding: 0;
        }' > public/css/app.css
        npm i bootstrap
        code .
        code index.html
        code public/css/app.css
    elif [[ $option == "s" ]];then
        mkdir -p src/sass/modules/home/home/main
        touch src/sass/{app.scss,_allModules.scss,_variables.scss} src/sass/modules/home/_home.scss src/sass/modules/home/home/{_header.scss,_main.scss,_footer.scss}
        echo '<!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Home page</title>
                <link rel="stylesheet" href="./public/css/app.css">
            </head>

            <body>
                <header>
                
                </header>
                <main>
                    
                </main>
                <footer>

                </footer>

                <script src="./node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>
            </body>

            </html>' > index.html


        echo '@import "./modules/home/home";' > src/sass/_allModules.scss

        echo '@import "./home/header";
                @import "./home/main";
                @import "./home/footer";' > src/sass/modules/home/_home.scss

        echo '  @import "./variables";
                @import "../../node_modules/bootstrap/scss/bootstrap.scss";
                @import "../../node_modules/bootstrap-icons/font/bootstrap-icons.css";
                @import "./allModules";' > src/sass/app.scss

        echo '  @import "../../node_modules/bootstrap/scss/functions";
                @import "../../node_modules/bootstrap/scss/variables" ;
                $alpha: white;
                $beta: white;            
                $colors: (
                    "alpha": $alpha , 
                    "beta": $beta ,
                );
                $theme-colors: map-merge($colors , $theme-colors);

                $spacer: 1px;
                @for $i from 1 through 50 {
                $spacers: map-merge($spacers, ($i : $spacer * $i) );
                }' > src/sass/_variables.scss

        npm i bootstrap
        npm i bootstrap-icons
        code .
        code index.html
        code public/css/app.css
    fi
}
page(){
    read -p "enter name of page : " pageName
    echo '
    <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>'$pageName'</title>
            <link rel="stylesheet" href="../css/app.css">
        </head>
        <body>
            <header>
                
                </header>
                <main>
                    
                </main>
                <footer>
                        
                </footer>
                <script src="./node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>
        </body>
    </html>' > public/pages/$pageName.html

    read -p "you work on normal project or scss project : " option
    if [[ $option == "n" ]];then
        code public/pages/$pageName.html
    elif [[ $option == "s" ]];then
        mkdir -p src/sass/modules/$pageName

        mkdir -p src/sass/modules/$pageName/$pageName

        touch src/sass/modules/$pageName/_$pageName.scss src/sass/modules/$pageName/$pageName/{_header.scss,_main.scss,_footer.scss}

        echo '@import "./'$pageName'/header";
            @import "./'$pageName'/main";
            @import "./'$pageName'/footer";' > src/sass/modules/$pageName/_$pageName.scss

        echo '@import "./modules/home/home";
        @import "./modules/'$pageName'/'$pageName'";' > src/sass/_allModules.scss
        code public/pages/$pageName.html
        code src/sass/modules/$pageName/$pageName/_header.scss
    fi
}
watch () {
    sass --watch src/sass/app.scss public/css/app.css
}
