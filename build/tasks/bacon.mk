# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------
# PixelProject OTA update package

CUSTOM_TARGET_PACKAGE := $(PRODUCT_OUT)/$(CUSTOM_VERSION).zip
SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

CL_CYN="\033[36m"
CL_PRP="\033[35m"


.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(CUSTOM_TARGET_PACKAGE)
	$(hide) $(SHA256) $(CUSTOM_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(CUSTOM_TARGET_PACKAGE).sha256sum
	@echo -e ${CL_CYN}""${CL_CYN}
	@echo -e ${CL_PRP}""${CL_CYN}
	@echo -e ${CL_CYN}"  _____ _______   ________ _        _____  _____   ____       _ ______ _____ _______ "${CL_CYN}
	@echo -e ${CL_CYN}" |  __ \_   _\ \ / /  ____| |      |  __ \|  __ \ / __ \     | |  ____/ ____|__   __|"${CL_CYN}
	@echo -e ${CL_CYN}" | |__) || |  \ V /| |__  | |      | |__) | |__) | |  | |    | | |__ | |       | |   "${CL_CYN}
	@echo -e ${CL_CYN}" |  ___/ | |   > < |  __| | |      |  ___/|  _  /| |  | |_   | |  __|| |       | |   "${CL_CYN}
	@echo -e ${CL_CYN}" | |    _| |_ / . \| |____| |____  | |    | | \ \| |__| | |__| | |___| |____   | |   "${CL_CYN}
	@echo -e ${CL_CYN}" |_|   |_____/_/ \_\______|______| |_|    |_|  \_\\____/ \____/|______\_____|  |_|   "${CL_CYN}
	@echo -e ${CL_CYN}""${CL_CYN}
	@echo -e ${CL_CYN}""${CL_CYN}
	echo -e ${CL_BLD}${CL_RED}"===============================-Package complete-==============================="${CL_RED}
	$(hide) ./vendor/aosp/tools/generate_json_build_info.sh $(CUSTOM_TARGET_PACKAGE)
	echo -e ${CL_BLD}${CL_CYN}"Datetime :"${CL_PRP}" `cat $(PRODUCT_OUT)/system/build.prop | grep ro.build.date.utc | cut -d'=' -f2 | awk '{print $$1}' `"${CL_RST}
	echo -e ${CL_BLD}${CL_CYN}"Size:"${CL_PRP}" `du -sh $(CUSTOM_TARGET_PACKAGE) | awk '{print $$1}' `"${CL_RST}
	echo -e ${CL_BLD}${CL_CYN}"Filehash: "${CL_PRP}" `md5sum $(CUSTOM_TARGET_PACKAGE) | awk '{print $$1}' `"${CL_RST}
	echo -e ${CL_BLD}${CL_CYN}"Filename: "${CL_PRP} $(CUSTOM_TARGET_PACKAGE)${CL_RST}
	echo -e ${CL_BLD}${CL_CYN}"ID: "${CL_PRP}" `cat $(CUSTOM_TARGET_PACKAGE).sha256sum | awk '{print $$1}' `"${CL_RST}
	echo -e ${CL_BLD}${CL_CYN}"================================================================================"${CL_CYN}
