<?php
require 'src/SelectController.php';

$type = empty($_GET["type"]) ? "organisation" : $_GET["type"];

if($type === "organisation"){
    $table = "organisation";
    $foreign = "foreign_id";
    $filter = $_GET['filter'];
}
elseif($type === "personnages"){
    $table = "personnages";
    $foreign = "foreign_id";
    $filter = $_GET['filter'];
}
else{
    throw new Exception("Unknown type" . $type);
}
//Make new controller
$selectCtrl = New SelectController();

//Call methods
$items = $selectCtrl->getSelect($table, $filter);
var_dump($items);
echo json_encode (array_map(function($item){
    
    return [
        'label' => $item['name'],
        'value' => $item['id']
    ];
}, $items));
?>