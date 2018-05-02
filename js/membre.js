function rendreVisible(elem){
	document.getElementById(elem).style.display='block';
}

function rendreInvisible(elem){
	document.getElementById(elem).style.display='none';
}

   var courrielTaper = /^[a-zA-Z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$/;
   var motTaper=/^[a-zA-Z ]+$/;
   var dateNaissanceTaper=/[0-9]{2}[/][0-9]{2}[/][0-9]{4}$/;
   var telephoneTaper=/^\D*([2-9]\d{2})(\D*)([2-9]\d{2})(\D*)(\d{4})\D*/;
   var motPasseTaper= /^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})/;
   var codePostalTaper=/^[ABCEGHJ-NPRSTVXY]\d[ABCEGHJ-NPRSTV-Z][ -]?\d[ABCEGHJ-NPRSTV-Z]\d$/i;
   
function surligne(champ, erreur)
{
   if(erreur){
      champ.style.backgroundColor = "#fba";
      champ.value = '';}
   else
      champ.style.backgroundColor = "";
}
function verifDonnerTaper(champ,expresReg)
{
   var donnes = expresReg;	
   if(!donnes.test(champ.value))
   {
      surligne(champ, true);
      document.getElementById("messages").innerHTML="Verifier les donnes.";	
      setTimeout(function(){ $('#messages').html(""); }, 2000); 	  
      return false;
   }
   else
   {
      surligne(champ, false);
      return true;
   }
}

function verifierFormulaire()
{
var motPasse = document.getElementById("motPasse");
var confirmPasword = document.getElementById("confirmPasword");
var nom = document.getElementById("nom");
var prenom = document.getElementById("prenom");
var telephone = document.getElementById("telephone");
var dateNaissance = document.getElementById("dateNaissance");
var nomRue = document.getElementById("nomRue");
var ville = document.getElementById("ville");
var codePostal = document.getElementById("codePostal");
var courriel = document.getElementById("courriel");
  if((motPasse.value != confirmPasword.value)||(nom.value=="")||(prenom.value=="")||(telephone.value=="")||(dateNaissance.value=="")||(nomRue.value=="")||(ville.value=="")||(codePostal.value=="")||(courriel.value==""))
  {
    document.getElementById("messages").innerHTML="Completer bien le formulaire!";
	setTimeout(function(){ $('#messages').html(""); }, 3000); 
	motPasse.value="";confirmPasword.value="";
	document.getElementById("valider").disabled = true;
  }
  else
  {        
			document.getElementById("valider").disabled = false;			
			
  }
}
