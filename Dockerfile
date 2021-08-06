FROM existdb/existdb:5.0.0

COPY conf/conf.xml /exist/etc
COPY notrestxq/build/*.xar /exist/autodeploy
COPY orbeon/build/*.xar /exist/autodeploy
COPY restxq/build/*.xar /exist/autodeploy
COPY visualize/build/*.xar /exist/autodeploy