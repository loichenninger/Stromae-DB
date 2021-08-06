xquery version "3.0";
import module namespace request="http://exist-db.org/xquery/request";
import module namespace reponse="http://www.insee.fr/collectes/reponse" at "../restxq/reponse/reponse.xqm";

declare option exist:serialize "method=xml media-type=text/xml";

let $data := request:get-data()

let $path := request:get-parameter('path', ())
let $enquete := tokenize($path, '/')[4]
let $model := tokenize($path, '/')[5]
let $ue := tokenize($path, '/')[6]

let $ongletproof := request:get-parameter('ongletproof', "youpi")
let $instance := reponse:post-reponse-reexpedition ($data,$enquete,$model,$ue,$ongletproof)


return $instance


