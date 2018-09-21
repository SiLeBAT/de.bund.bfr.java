API="https://api.bintray.com/content/silebat/java"
PROPS=";bt_package=update;bt_version=1.0;publish=1;override=1"
FOLDER="$TRAVIS_BUILD_DIR/releng/de.bund.bfr.java.update/target/repository"

curl -u $BINTRAY_USER:$BINTRAY_KEY -T $FOLDER/artifacts.jar $API/artifacts.jar$PROPS
curl -u $BINTRAY_USER:$BINTRAY_KEY -T $FOLDER/content.jar $API/content.jar$PROPS

# Upload plugins (plugin includes the plugins/ folder)
for plugin in $FOLDER/plugins/*.jar; do
	file=$(basename -- "$plugin")
	curl -u $BINTRAY_USER:$BINTRAY_KEY -T $plugin $API/plugins/$file$PROPS
done
