//vue films
function profil(profilUser){
	var taille;
	//taille=profilUser.length;
	var rep="<ul class='nav navbar-top-links navbar-right pull-right'>";
	rep+="<li class='dropdown'>";
	rep+="<a class='dropdown-toggle profile-pic' data-toggle='dropdown' href='javascript:void(0)'><img src='fotoMembre/"+profilUser[0].photoMembre+"' alt='user-img' width='36' class='img-circle'><b class='hidden-xs'>&nbsp  "+profilUser[0].prenom+"</b><span class='caret'></span></a>";
	rep+="<ul class='dropdown-menu dropdown-user animated flipInY'>";
	rep+="<li><a href='javascript:void(0)'><i class='fa fa-user-o'></i><b onClick='#'>&nbsp Mon Profile</b></a></li><li><a href='javascript:void(0)'><i class='fa fa-envelope-o'></i><b onClick='#'>&nbsp Mes messages</b></a></li><li><a href='javascript:void(0)'> <a href='index.html'><i class='fa fa-power-off'></i><b>&nbspDeconnecter</b></a></a>";
	rep+="</li></ul>";
	$('#user').html(rep);
}
function listerF(listFilms){
	var taille;
	var rep="<div class='table-users' style='overflow: scroll; height: 500px;'>";
	rep+="<div class='header'>Liste des films<span style='float:right;padding-right:10px;cursor:pointer;' onClick=\"$('#contenu').hide();\">X</span></div>";
	rep+="<table cellspacing='0'>";
	rep+="<tr><th>NUMERO</th><th>TITRE</th><th>DUREE</th><th>REALISATEUR</th><th>POCHETTE</th></tr>";
	taille=listFilms.length;
	for(var i=0; i<taille; i++){
		rep+="<tr><td>"+listFilms[i].idf+"</td><td>"+listFilms[i].titre+"</td><td>"+listFilms[i].duree+"</td><td>"+listFilms[i].res+"</td><td><img src='pochettes/"+listFilms[i].pochette+"' width=80 height=80></td></tr>";		 
	}
	rep+="</table>";
	rep+="</div>";
	$('#contenu').html(rep);
}

function afficherFiche(reponse){
  var uneFiche;
  if(reponse.OK){
	uneFiche=reponse.fiche;
	$('#formFicheF h3:first-child').html("Fiche du film numero "+uneFiche.idf);
	$('#idf').val(uneFiche.idf);
	$('#titreF').val(uneFiche.titre);
	$('#dureeF').val(uneFiche.duree);
	$('#resF').val(uneFiche.res);
	$('#divFormFiche').show();
	document.getElementById('divFormFiche').style.display='block';
  }else{
	$('#messages').html("Film "+$('#numF').val()+" introuvable");
	setTimeout(function(){ $('#messages').html(""); }, 5000);
  }

}

var membreVue=function(reponse){
	var action=reponse.action; 
	switch(action){
		case "enregistrer" :
		case "enlever" :
		case "modifier" :
		case "connecter" :
			$('#messages').html(reponse.msg);
			setTimeout(function(){ $('#messages').html(""); }, 5000);
		break;
		case "connecterUser" :
			profil(reponse.connecterUser);
		break;
		case "lister" :
			profil(reponse.listeFilms);
		break;
		case "fiche" :
			afficherFiche(reponse);
		break;
		
	}
}

