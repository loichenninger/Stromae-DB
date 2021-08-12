xquery version "3.0";
module namespace reponse="http://www.insee.fr/collectes/reponse";
import module namespace common= "http://www.insee.fr/collectes/commonstromae/common" at "../common/commonStromae.xqm";



declare namespace rest="http://exquery.org/ns/restxq";
declare variable $reponse:version := "20171206-OR" ;

(:~
 : HELLOWORLD
 :
 : GET /contact/helloworld
 :
 : @return 200 + <resultat><xqm>{'/reponse/helloworld'}</xqm><version>{$modelt:version}</version><message>{"Chuck Norris peut faire du feu en frottant deux glaçons."}</message></resultat>
:)

declare
%rest:GET
%rest:path("/reponse/helloworld")
function reponse:helloworld() as item()+{
    let $mess:=<resultat><xqm>{'/reponse/helloworld'}</xqm><version>{$reponse:version}</version><message>{"Chuck Norris peut faire du feu en frottant deux glaçons."}</message></resultat>
    return (common:rest-response(200,$mess))
};


declare
%rest:GET
%rest:path("/collectes/reponse/{$enquete}/{$modele}/{$unite}")
function reponse:get-reponse ( $enquete as xs:string*, $modele as xs:string*,$unite as xs:string*) as node()* 
{
let $col := common:calcol($unite)
let $doc := concat('/db/orbeon/fr/',$enquete,'/',$modele,'/data/','init/',$col,'/',$unite,'.xml')
return 
if (doc-available($doc)) then (doc($doc))
else (common:rest-response(404,"Fichier reponse introuvable"))
};


