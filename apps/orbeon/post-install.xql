xquery version "1.0";

import module namespace xmldb="http://exist-db.org/xquery/xmldb";

(: The following external variables are set by the repo:deploy function :)

(: file path pointing to the exist installation directory :)
declare variable $home external;
(: path to the directory containing the unpacked .xar package :)
declare variable $dir external;
(: the target collection into which the app is deployed :)
declare variable $target external;

xmldb:create-collection("/db","orbeon"),
xmldb:move("/db/apps/orbeon/fr","/db/orbeon"),
sm:chmod(xs:anyURI("/db/orbeon/fr"), 'rwxrwxrwx')