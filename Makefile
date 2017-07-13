ARCHS = armv7 arm64

include theos/makefiles/common.mk

BUNDLE_NAME = SiriToggle
SiriToggle_FILES = Switch.xm
SiriToggle_FRAMEWORKS = UIKit
SiriToggle_PRIVATE_FRAMEWORKS = AssistantServices
SiriToggle_LIBRARIES = flipswitch
SiriToggle_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk