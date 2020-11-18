xquery version "3.0";
module namespace getform="http://www.insee.fr/collectes/getform";

  
(:TEST HELLOWORLD:)
declare
%rest:GET
%rest:path("/getform/helloworld")
%rest:query-param("racine", "{$racine-enquete}","")
function getform:helloworld($racine-enquete as xs:string*) as item()+{
    let $log := util:log("INFO", "getform:helloworld - racine : "||$racine-enquete||"*****************************************************")     
    return(
    <results>
        <message>hello getform</message>
    </results>)
};

(:FORM:) 
declare
%rest:GET
%rest:path("/db/orbeon/fr/{$enquete}/{$model}/form/form.xhtml")

function getform:get-form ($enquete as xs:string*, $model as xs:string*) as node()*
{

let $cheminfic := concat('/db/orbeon/fr/',$enquete,'/',$model,'/form/form.xhtml')
let $form := doc($cheminfic)
    
return 
$form
};