xquery version "3.0";

declare variable $exist:path external;

if (starts-with($exist:path, "/collectes/reponse/")) then

<dispatch xmlns="http://exist.sourceforge.net/NS/exist">
    <forward url="/../notrestxq/reponses.xql">
        <add-parameter name="path" value="{$exist:path}"/>
    </forward>
    <cache-control cache="no"/>
</dispatch>

else
(: everything else is passed through :)
<dispatch xmlns="http://exist.sourceforge.net/NS/exist">
    <cache-control cache="yes"/>
</dispatch>