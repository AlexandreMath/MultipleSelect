<?php 
    require 'src/SelectController.php'; 
    $appar = new SelectController();
    $result =$appar->getFirstSelect();
    //$urlOrg = "http://localhost:88/SelectAjax/list.php?type=organisation&filter=$id";
    //$urlPer = "http://localhost:88/SelectAjax/list.php?type=personnages&filter=$id";
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-win8.css">
    <link rel="stylesheet" href="css/style.css">
    <title>Select Ajax</title>
</head>
<body>
    <nav class="w3-bar w3-win8-steel">
        <a href="#" class="w3-bar-item w3-button">Home</a>
        <a href="#" class="w3-bar-item w3-button">List</a>
    </nav>
    <main class="w3-container">
        <h1>Selects Ajax</h1>
        <p>L'objectif est de lier 3 selects afin que l'utilisateur puisse sélectionnner son personnage.</p>
        <form action="" class="w3-row-padding w3-margin-bottom">
            <div class="w3-third">
                <label class="text-steel"><b>Appartenance</b></label>
                <select class="w3-input w3-border linked-select" data-target="#organisation" data-source="http://localhost:88/SelectAjax/list.php?type=organisation&filter=$id"
                     name="appartenance" id="appartenance">
                    <option value="0">Sélectionnez votre Appartenance</option>
                    <?php 
                        for($i = 0; $i < count($result); $i++){
                            echo '<option value="'.$result[$i]->id.'" >'.$result[$i]->name.'</option>';
                        }                
                    ?>
                </select>
            </div>
            <div class="w3-third">
                <label class="text-steel" id="titre1"><b>Organisation</b></label>
                <select class="w3-input w3-border linked-select" data-target="#personnages" data-source="http://localhost:88/SelectAjax/list.php?type=personnages&filter=$id" 
                    name="organisation" id="organisation" style="display:none">
                    <option value="0">Sélectionnez votre Organisation</option>
                </select>
            </div>
            <div class="w3-third">
                <label class="text-steel" id="titre2"><b>Personnages</b></label>
                <select class="w3-input w3-border" name="personnages" id="personnages" style="display:none">
                    <option value="0">Sélectionnez votre Personnage</option>
                </select>
            </div>
 
        </form>
        <!--Text à afficher quand tout est selectionnés-->
        <div class="w3-panel w3-win8-olive" id="panel" style="visibility:hidden">
            <h2 id="name">Lorem</h2>
            <p class="description">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Atque similique architecto blanditiis nobis, alias saepe veritatis officia maiores quod, rem voluptatibus unde, illum fugit id. Minus fuga inventore voluptate nulla!.</p>
        </div>

    </main>

    <script src="js/main.js"></script>
</body>
</html>