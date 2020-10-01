FROM existdb/existdb:5.0.0

COPY conf/conf.xml /exist/etc
COPY orbeon/build/*.xar /exist/autodeploy
COPY restxq/build/*.xar /exist/autodeploy