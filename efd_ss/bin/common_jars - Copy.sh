JAVA_HOME=/h/installer/jdk1.8.0_152/jre

LIB=$EFD_HOME/lib
CONF=$EFD_HOME/conf
SITE_DIR=$EFD_HOME/site

APACHE_COMMONS_JARS=$LIB/commons-cli-1.1.jar:$LIB/commons-codec-1.3.jar:$LIB/commons-collections-3.2.2.jar
APACHE_COMMONS_JARS=$APACHE_COMMONS_JARS:$LIB/commons-daemon-1.0.3.jar:$LIB/commons-httpclient-3.1.jar
APACHE_COMMONS_JARS=$APACHE_COMMONS_JARS:$LIB/commons-io-2.11.0.jar:$LIB/commons-lang-2.3.jar
APACHE_COMMONS_JARS=$APACHE_COMMONS_JARS:$LIB/commons-logging-1.1.jar:$LIB/commons-net-3.9.0.jar

ASPECT_JWEAVER=$LIB/aspectjweaver-1.8.7.jar
ASPECT_JARS=$LIB/aspectjrt-1.8.7.jar:$ASPECT_JWEAVER

BC_JARS=$LIB/bcpkix-jdk15on-1.53.jar:$LIB/bcprov-ext-jdk15on-1.53.jar:$LIB/bcprov-jdk15on-1.53.jar

DERBY_JARS=$LIB/derby-10.14.2.jar:$LIB/derbyclient-10.14.2.jar:$LIB/derbynet-10.14.2.jar
DERBY_JARS=$DERBY_JARS:$LIB/derbytools-10.14.2.jar

DB_JARS=$LIB/c3p0-0.9.1.1.jar:$LIB/dom4j-2.1.3.jar

EFD_JARS=$LIB/EFD-2.2-inventory-fs.jar
EFD_JARS=$EFD_JARS:$LIB/EFD-2.2-inventory-zip.jar:$LIB/EFD-2.2-inventory.jar
EFD_JARS=$EFD_JARS:$LIB/EFD-2.2-jmx.jar:$LIB/EFD-2.2-lucene.jar:$LIB/EFD-2.2-main.jar
EFD_JARS=$EFD_JARS:$LIB/EFD-2.2-security.jar:$LIB/EFD-2.2-ui.jar:$LIB/EFD-2.2-util.jar

FTP_JARS=$LIB/ftplet-api-1.0.0-RC2.jar:$LIB/ftpserver-core-1.0.0-RC2.jar

HIB_JARS=$LIB/hibernate-3.2.6.ga.jar:$LIB/hibernate-annotations-3.3.1.GA.jar
HIB_JARS=$HIB_JARS:$LIB/hibernate-commons-annotations-3.3.0ga.jar:$LIB/hibernate-validator-3.0.0.ga.jar
HIB_JARS=$HIB_JARS:$LIB/cglib-nodep-3.1.jar

JAVAX_JARS=$LIB/jta.jar:$LIB/ejb3-persistence-3.0.jar

JETTY_JARS=$LIB/jetty-6.1.11.jar:$LIB/jetty-util-6.1.11.jar

JSP_JARS=$LIB/jasper-6.0.32.jar:$LIB/juli-6.0.32.jar:$LIB/javax.servlet.jsp-api-2.3.1.jar

JYTHON_JARS=$LIB/jython-2.7.2.jar:$LIB/jython-engine.jar

LOG_JARS=$LIB/log4j-1.2-api-2.17.2.jar:$LIB/log4j-api-2.17.2.jar:$LIB/log4j-core-2.17.2.jar:$LIB/slf4j-api-1.4.3.jar:$LIB/slf4j-api-2.0.6.jar

POLICY_JARS=$LIB/US_export_policy.jar:$LIB/local_policy.jar

REST_JARS=$LIB/org.restlet.ext.jetty_6.1.jar:$LIB/org.restlet.ext.spring_2.5.jar:$LIB/org.restlet.jar

RSA_JARS=$LIB/cryptojce.jar:$LIB/cryptojcommon.jar:$LIB/jcmFIPS.jar:$LIB/rsamisc.jar:$LIB/util.jar

SPRING_JARS=$LIB/spring-aop-3.0.0.RELEASE.jar:$LIB/spring-asm-3.0.0.RELEASE.jar:$LIB/spring-aspects-3.0.0.RELEASE.jar
SPRING_JARS=$SPRING_JARS:$LIB/spring-beans-3.0.0.RELEASE.jar:$LIB/spring-context-3.0.0.RELEASE.jar
SPRING_JARS=$SPRING_JARS:$LIB/spring-context-support-3.0.0.RELEASE.jar
SPRING_JARS=$SPRING_JARS:$LIB/spring-core-3.0.0.RELEASE.jar:$LIB/spring-expression-3.0.0.RELEASE.jar
SPRING_JARS=$SPRING_JARS:$LIB/spring-jdbc-3.0.0.RELEASE.jar:$LIB/spring-orm-3.0.0.RELEASE.jar
SPRING_JARS=$SPRING_JARS:$LIB/spring-security-core-5.5.7.jar:$LIB/spring-security-crypto-5.5.7.jar:$LIB/spring-security-web-5.5.7.jar:$LIB/spring-tx-3.0.0.RELEASE.jar
SPRING_JARS=$SPRING_JARS:$LIB/spring-web-3.0.0.RELEASE.jar

EXTRA_PATHS=$EFD_HOME/web/WEB-INF/classes:$CONF:$SITE_DIR/conf:$CONF/spring

XSTREAM_JARS=$LIB/xmlpull-1.1.3.1.jar:$LIB/xpp3_min-1.1.4c.jar:$LIB/xstream-1.4.1.jar

CLASSPATH=$EFD_JARS:$POLICY_JARS:$LIB/ant-1.10.13.jar:$LIB/antlr-2.7.6.jar:$LIB/aopalliance-1.0.jar
CLASSPATH=$CLASSPATH:$ASPECT_JARS:$BC_JARS
CLASSPATH=$CLASSPATH:$DB_JARS:$APACHE_COMMONS_JARS:$RSA_JARS:$DERBY_JARS
CLASSPATH=$CLASSPATH:$LIB/dwr-3.0.2-RELEASE.jar:$FTP_JARS:$HIB_JARS:$LIB/jcifs-1.3.18.jar:$LIB/jdpapi-java-1.0.1.jar
CLASSPATH=$CLASSPATH:$LIB/jettison-1.5.3.jar:$JAVAX_JARS:$JETTY_JARS:$JSP_JARS:$JYTHON_JARS:$LOG_JARS
CLASSPATH=$CLASSPATH:$LIB/lucene-core-2.4.0.jar:$LIB/mina-core-2.0.23.jar:$REST_JARS:$LIB/quartz-1.6.4.jar
CLASSPATH=$CLASSPATH:$LIB/servlet-api-2.5-6.1.7.jar:$SPRING_JARS:$XSTREAM_JARS:$EXTRA_PATHS
