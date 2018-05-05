<?php
function array2xml($array, $xml = false){

    if($xml === false){
        $xml = new SimpleXMLElement('<result/>');
    }

    foreach($array as $key => $value){
        if(is_array($value)){
            array2xml($value, $xml->addChild($key));
        } else {
            $xml->addChild($key, $value);
        }
    }

    return $xml->asXML();
}
$stream_opts = [
    "ssl" => [
        "verify_peer"=>false,
        "verify_peer_name"=>true,
    ]
];  

    $address="j4y1p8";
    $base_url="https://maps.googleapis.com/maps/api/geocode/json?";
            // ajouter &region=FR si ambiguité (lieu de la requete pris par défaut)
    $request_url = $base_url . "address=" . urlencode($address).'&sensor=false';
    $request_url=$request_url.'&key=AIzaSyAh16rY5nupNwM84ZlLOht27MOM3PdxiqY';

    $response = file_get_contents($request_url,
               false, stream_context_create($stream_opts));
    var_dump($response);

    $json = json_decode($response, false);
//    $xml = array2xml($json, false);
//    print_r($xml);
    //var_dump($json);
    echo "Formated address: ".$json->results[0]->formatted_address;
    echo "Status: ".$json->status;
    echo "lng: ".$json->results[0]->geometry->location->lng;
    echo "lat: ".$json->results[0]->geometry->location->lat;
?>