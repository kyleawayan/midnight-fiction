BASE_PATH = "/Applications/Native Instruments/Traktor Pro 4/Traktor Pro 4.app/Contents/Resources/qml"
# https://gist.github.com/bbl/5429c4a0a498c5ef91c10201e1b651c2
PROJECT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

CURRENT_USER = $(shell whoami)
CURRENT_GROUP = $(shell id -g -n $(CURRENT_USER))

import:
	rm -r $(PROJECT_DIR)/qml

	mkdir -p $(PROJECT_DIR)/qml/CSI/S4MK3
	mkdir -p $(PROJECT_DIR)/qml/CSI/Common
	mkdir -p $(PROJECT_DIR)/qml/Screens/S4MK3

	cp -r $(BASE_PATH)/CSI/S4MK3/ $(PROJECT_DIR)/qml/CSI/S4MK3/
	cp -r $(BASE_PATH)/CSI/Common/DeckHelpers.js $(PROJECT_DIR)/qml/CSI/Common/DeckHelpers.js # for deck colors
	cp -r $(BASE_PATH)/Screens/S4MK3/ $(PROJECT_DIR)/qml/Screens/S4MK3/

	cp -r $(BASE_PATH)/Screens/S8/ $(PROJECT_DIR)/qml/Screens/S8_MIDNIGHT_FICTION/

install:
	mkdir -p $(PROJECT_DIR)/qml_folder_backup
	cp -r $(BASE_PATH) $(PROJECT_DIR)/qml_folder_backup

	# If BASE_PATH already belongs to user, we don't need to change it
	if [ "$(CURRENT_USER)" != "$(shell stat -f %Su $(BASE_PATH))" ]; then \
		echo "Need to change permissions to $(CURRENT_USER):$(CURRENT_GROUP) for the Traktor qml folder."; \
		sudo chown -R $(CURRENT_USER):$(CURRENT_GROUP) $(BASE_PATH); \
	else \
		echo "No permission modifications were made."; \
	fi

	cp -r $(PROJECT_DIR)/qml/CSI/S4MK3/ $(BASE_PATH)/CSI/S4MK3/
	cp -r $(PROJECT_DIR)/qml/CSI/Common/DeckHelpers.js $(BASE_PATH)/CSI/Common/DeckHelpers.js
	cp -r $(PROJECT_DIR)/qml/Screens/S4MK3/ $(BASE_PATH)/Screens/S4MK3/

	cp -r $(PROJECT_DIR)/qml/Screens/S8_MIDNIGHT_FICTION/ $(BASE_PATH)/Screens/S8_MIDNIGHT_FICTION/