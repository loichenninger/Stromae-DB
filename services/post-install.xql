xquery version "1.0";

import module namespace xmldb="http://exist-db.org/xquery/xmldb";

(: The following external variables are set by the repo:deploy function :)

(: file path pointing to the exist installation directory :)
declare variable $home external;
(: path to the directory containing the unpacked .xar package :)
declare variable $dir external;
(: the target collection into which the app is deployed :)
declare variable $target external;

xmldb:create-collection("/db","services"),
xmldb:store("/db", "properties.xml", doc("/db/apps/services/orbeon/properties.xml")),
xmldb:store("/db", "visualize.xqm", doc("/db/apps/services/orbeon/visualize.xqm")),
xmldb:move("/db/apps/services/orbeon","/db/services")