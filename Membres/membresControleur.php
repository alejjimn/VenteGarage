<?php
	require_once("../includes/modele.inc.php");
	$tabRes=array();
	function enregistrer(){
		global $tabRes;	
		$nom=$_POST['nom'];
		$prenom=$_POST['prenom'];
		$telephone=$_POST['telephone'];
		$dateNaissance=$_POST['dateNaissance'];
		$sexe=$_POST['sexe'];
		$region=$_POST['region'];
		$ville=$_POST['ville'];
		$numeroCivique=$_POST['numeroCivique'];
		$nomRue =$_POST['nomRue'];
		$codePostal=strtoupper($_POST['codePostal']);//transformer en majuscule
		$codePostal=str_replace(' ','',$codePostal);//netoyer l'espace
		$courriel=$_POST['courriel'];
		$motPasse=$_POST['motPasse'];
		$confirmPasword=$_POST['confirmPasword'];
		$coords=getXmlCoordsFromAdress($codePostal);
        $latitude=$coords['lat'];
	    $longitude=$coords['lon']; 
		$motPasse=sha1($motPasse);//encrypter le password
		try{ 
		if (($latitude==null)&&($longitude==null)){ 
			$tabRes['action']="enregistrer";
			$tabRes['msg']="<div class=\"alert alert-danger\">"
					  . " <strong>Votre adresse est inexistente</strong>"
					  . " </div>"
					 ."";}
			$unModele=new membreModele();
			$requete5="SELECT idMembre FROM membres WHERE courriel=? ";
				$unModele=new membreModele($requete5,array($courriel));
				$stmt=$unModele->executer();
				if(!$ligne=$stmt->fetch(PDO::FETCH_OBJ)){
                        if (($latitude!=null)&&($longitude!=null)){					
						$unModele=new membreModele();
						$photoMembre=$unModele->verserFichier("fotoMembre", "photoMembre", "avatar.jpg",$nom);
						$requete1="INSERT INTO membres VALUES(0,?,?,?,?,?,?,?,?)";
						$unModele=new membreModele($requete1,array($prenom,$nom,$telephone,$dateNaissance,$sexe,$photoMembre,$courriel,$motPasse));
						$stmt=$unModele->executer();
								$unModele=new membreModele();
								$requete2="SELECT idMembre FROM membres WHERE prenom=? and nom=?  ";
								$unModele=new membreModele($requete2,array($prenom,$nom));
								$stmt=$unModele->executer();							
								$ligne=$stmt->fetch(PDO::FETCH_OBJ);								
								$idMembre=$ligne->idMembre;	                               	 
								$unModele=new membreModele();
								$requete3="INSERT INTO adresses VALUES(0,?,?,?,?,?,?,?,?)";$unModele=new membreModele($requete3,array($idMembre,$numeroCivique,$nomRue,$ville,$codePostal,$region,$latitude,$longitude));
								$stmt=$unModele->executer();												
								$tabRes['action']="enregistrer";
								$tabRes['msg']="Membre bien enregistre";
								 connecterUser($courriel);}						
						                                  }
				 else           {$tabRes['action']="enregistrer";
								 $tabRes['msg']="Couriel enregistre";}		
		}catch(Exception $e){
		}finally{
			unset($unModele);
		}
}
function connecter(){
		global $tabRes;
		//$tabRes['action']="connecter";
		$courriel=$_POST['courrielConect'];
		$motPasse=$_POST['passeConnect'];
        $motPasseV=sha1($motPasse);				
		try{
			$unModele=new membreModele();
			$requete="SELECT idMembre FROM membres WHERE courriel=? and motPasse=? ";
			$unModele=new membreModele($requete,array($courriel,$motPasseV));
			$stmt=$unModele->executer();
			if($ligne=$stmt->fetch(PDO::FETCH_OBJ)){
				if ($courriel=="admin"){
				 $tabRes['action']="connecter";
			     $tabRes['msg']="<div class=\"alert alert-success\">"
					  . "   <strong>Bien venu admin!</strong>"
					  . " </div>"
					 ."";}
				  else{
				 $tabRes['action']="connecter";
			     $tabRes['msg']="<div class=\"alert alert-success\">"
					  . "   <strong>Bien venu membre!</strong>"
					  . " </div>"
					 ."";
                     connecterUser($courriel);					 
					 }			
			 }
			else{
			 $tabRes['action']="connecter";
			     $tabRes['msg']="<div class=\"alert alert-danger\">"
					  . " <strong>Vous n'est pas enregistre!</strong>"
					  . " </div>"
					 ."";						  
			}
		}catch(Exception $e){
		}finally{
			unset($unModele);
		}
		session_start();
		$_SESSION['courriel'] = $_POST['courrielConect'];
	} 
    function connecterUser($param){
		global $tabRes;
		$tabRes['action']="connecterUser";
		$requete="SELECT photoMembre, prenom FROM membres where courriel=? ";
		try{
			 $unModele=new membreModele($requete,array($param));
			 $stmt=$unModele->executer();
			 $tabRes['connecterUser']=array();
			 while($ligne=$stmt->fetch(PDO::FETCH_OBJ)){
			    $tabRes['connecterUser'][]=$ligne;
			}
		}catch(Exception $e){
		}finally{
			unset($unModele);
		}
	}	
	function lister(){
		global $tabRes;
		$tabRes['action']="lister";
		$requete="SELECT * FROM films";
		try{
			 $unModele=new membreModele($requete,array());
			 $stmt=$unModele->executer();
			 $tabRes['listeFilms']=array();
			 while($ligne=$stmt->fetch(PDO::FETCH_OBJ)){
			    $tabRes['listeFilms'][]=$ligne;
			}
		}catch(Exception $e){
		}finally{
			unset($unModele);
		}
	}
	
	function enlever(){
		global $tabRes;	
		$idf=$_POST['numE'];
		try{
			$requete="SELECT * FROM films WHERE idf=?";
			$unModele=new membreModele($requete,array($idf));
			$stmt=$unModele->executer();
			if($ligne=$stmt->fetch(PDO::FETCH_OBJ)){
				$unModele->enleverFichier("pochettes",$ligne->pochette);
				$requete="DELETE FROM films WHERE idf=?";
				$unModele=new membreModele($requete,array($idf));
				$stmt=$unModele->executer();
				$tabRes['action']="enlever";
				$tabRes['msg']="Film ".$idf." bien enleve";
			}
			else{
				$tabRes['action']="enlever";
				$tabRes['msg']="Film ".$idf." introuvable";
			}
		}catch(Exception $e){
		}finally{
			unset($unModele);
		}
	}
	
	function fiche(){
		global $tabRes;
		$idf=$_POST['numF'];
		$tabRes['action']="fiche";
		$requete="SELECT * FROM films WHERE idf=?";
		try{
			 $unModele=new membreModele($requete,array($idf));
			 $stmt=$unModele->executer();
			 $tabRes['fiche']=array();
			 if($ligne=$stmt->fetch(PDO::FETCH_OBJ)){
			    $tabRes['fiche']=$ligne;
				$tabRes['OK']=true ;
			}
			else{
				$tabRes['OK']=false;
			}
		}catch(Exception $e){
		}finally{
			unset($unModele);
		}
	}
	
	function modifier(){
		global $tabRes;	
		$titre=$_POST['titreF'];
		$duree=$_POST['dureeF'];
		$res=$_POST['resF'];
		$idf=$_POST['idf']; 
		try{
			//Recuperer ancienne pochette
			$requette="SELECT pochette FROM films WHERE idf=?";
			$unModele=new membreModele($requette,array($idf));
			$stmt=$unModele->executer();
			$ligne=$stmt->fetch(PDO::FETCH_OBJ);
			$anciennePochette=$ligne->pochette;
			$pochette=$unModele->verserFichier("pochettes", "pochette",$anciennePochette,$titre);	
			
			$requete="UPDATE films SET titre=?,duree=?, res=?, pochette=? WHERE idf=?";
			$unModele=new membreModele($requete,array($titre,$duree,$res,$pochette,$idf));
			$stmt=$unModele->executer();
			$tabRes['action']="modifier";
			$tabRes['msg']="Film $idf bien modifie";
		}catch(Exception $e){
		}finally{
			unset($unModele);
		}
	}
	function getXmlCoordsFromAdress($address)
{
	
$coords=array();
if ($address!=""){
$base_url="http://maps.googleapis.com/maps/api/geocode/xml?";
// ajouter &region=FR si ambiguité (lieu de la requete pris par défaut)
$request_url = $base_url . "address=" . urlencode($address).'&sensor=false';
$xml = simplexml_load_file($request_url) or die("url not loading");
//print_r($xml);
$coords['lat']=$coords['lon']='';
$coords['status'] = $xml->status ;
if($coords['status']=='OK')
{
 $coords['lat'] = $xml->result->geometry->location->lat ;
 $coords['lon'] = $xml->result->geometry->location->lng ;
 return $coords;
}
else return false;
}
}
	//******************************************************
	//Contrôleur
	$action=$_POST['action'];
	switch($action){
		case "enregistrer" :
			enregistrer();
		break;
		case "connecter" :
			connecter();
		break;
		case "lister" :
			lister();
		break;
		case "enlever" :
			enlever();
		break;
		case "fiche" :
			fiche();
		break;
		case "modifier" :
			modifier();
		break;
	}
	
echo json_encode($tabRes,JSON_UNESCAPED_UNICODE);
?>