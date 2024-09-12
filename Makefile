BASE_PATH = "/Applications/Native Instruments/Traktor Pro 4/Traktor Pro 4.app/Contents/Resources/qml"
# https://gist.github.com/bbl/5429c4a0a498c5ef91c10201e1b651c2
PROJECT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

import:
	rm -r $(PROJECT_DIR)/qml

	mkdir -p $(PROJECT_DIR)/qml/CSI/S4MK3
	mkdir -p $(PROJECT_DIR)/qml/Screens/S4MK3

	cp -r $(BASE_PATH)/CSI/S4MK3/ $(PROJECT_DIR)/qml/CSI/S4MK3/
	cp -r $(BASE_PATH)/Screens/S4MK3/ $(PROJECT_DIR)/qml/Screens/S4MK3/

install:
	cp -r $(PROJECT_DIR)/qml/CSI/S4MK3/ $(BASE_PATH)/CSI/S4MK3/
	cp -r $(PROJECT_DIR)/qml//ScreensS4MK3/ $(BASE_PATH)/Screens/S4MK3/