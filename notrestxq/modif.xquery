xquery version "3.1";
declare namespace xf="http://www.w3.org/2002/xforms";

<rezult>{
    for $campagne in xmldb:get-child-collections('/db/orbeon/fr')
    for $model in xmldb:get-child-collections(concat('/db/orbeon/fr/',$campagne))
    let $cheminform := concat('/db/orbeon/fr/',$campagne,'/',$model,'/form/form.xhtml')
    let $form := doc($cheminform)
    let $enregistrer := concat($form//xf:submission[@id="enregistrer"]/@resource,'')
    let $newenregistrer := replace($enregistrer,'restxq','apps/orbeon')
    let $expedier := concat($form//xf:submission[@id="expedier"]/@resource,'')
    let $newexpedier := replace($expedier,'restxq','apps/orbeon')
    let $deblocage := concat($form//xf:submission[@id="enregistrer-deblocage"]/@resource,'')
    let $newdeblocage := replace($deblocage,'restxq','apps/orbeon')
    
    let $update:= update value doc($cheminform)//xf:submission[@id="enregistrer"]/@resource with $newenregistrer
    let $update:= update value doc($cheminform)//xf:submission[@id="expedier"]/@resource with $newexpedier
    let $update:= update value doc($cheminform)//xf:submission[@id="enregistrer-deblocage"]/@resource with $newdeblocage
    
    
    
    return <ok>{$cheminform}</ok>
    }</rezult>

