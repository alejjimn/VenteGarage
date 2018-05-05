<?php
$address="j4y1p8";
    $base_url="https://maps.googleapis.com/maps/api/geocode/json?";
            // ajouter &region=FR si ambiguité (lieu de la requete pris par défaut)
    $request_url = $base_url . "address=" . urlencode($address).'&sensor=false';
    $request_url=$request_url.'&key=AIzaSyAh16rY5nupNwM84ZlLOht27MOM3PdxiqY';

$contextOptions = array(
    'ssl' => array(
        'verify_peer'   => false,
    )
);
$sslContext = stream_context_create($contextOptions);
$response = file_get_contents($request_url, NULL, $sslContext);
var_dump($response);
?>
