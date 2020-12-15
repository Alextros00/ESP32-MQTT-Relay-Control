deps_config := \
	/home/Alext/esp/esp-idf/components/app_trace/Kconfig \
	/home/Alext/esp/esp-idf/components/aws_iot/Kconfig \
	/home/Alext/esp/esp-idf/components/bt/Kconfig \
	/home/Alext/esp/esp-idf/components/driver/Kconfig \
	/home/Alext/esp/esp-idf/components/esp32/Kconfig \
	/home/Alext/esp/esp-idf/components/esp_adc_cal/Kconfig \
	/home/Alext/esp/esp-idf/components/esp_event/Kconfig \
	/home/Alext/esp/esp-idf/components/esp_http_client/Kconfig \
	/home/Alext/esp/esp-idf/components/esp_http_server/Kconfig \
	/home/Alext/esp/esp-idf/components/ethernet/Kconfig \
	/home/Alext/esp/esp-idf/components/fatfs/Kconfig \
	/home/Alext/esp/esp-idf/components/freemodbus/Kconfig \
	/home/Alext/esp/esp-idf/components/freertos/Kconfig \
	/home/Alext/esp/esp-idf/components/heap/Kconfig \
	/home/Alext/esp/esp-idf/components/libsodium/Kconfig \
	/home/Alext/esp/esp-idf/components/log/Kconfig \
	/home/Alext/esp/esp-idf/components/lwip/Kconfig \
	/home/Alext/esp/esp-idf/components/mbedtls/Kconfig \
	/home/Alext/esp/esp-idf/components/mdns/Kconfig \
	/home/Alext/esp/esp-idf/components/mqtt/Kconfig \
	/home/Alext/esp/esp-idf/components/nvs_flash/Kconfig \
	/home/Alext/esp/esp-idf/components/openssl/Kconfig \
	/home/Alext/esp/esp-idf/components/pthread/Kconfig \
	/home/Alext/esp/esp-idf/components/spi_flash/Kconfig \
	/home/Alext/esp/esp-idf/components/spiffs/Kconfig \
	/home/Alext/esp/esp-idf/components/tcpip_adapter/Kconfig \
	/home/Alext/esp/esp-idf/components/vfs/Kconfig \
	/home/Alext/esp/esp-idf/components/wear_levelling/Kconfig \
	/home/Alext/esp/esp-idf/components/wpa_supplicant/Kconfig \
	/home/Alext/esp/esp-idf/components/bootloader/Kconfig.projbuild \
	/home/Alext/esp/esp-idf/components/esptool_py/Kconfig.projbuild \
	/home/Alext/esp/tcp/main/Kconfig.projbuild \
	/home/Alext/esp/esp-idf/components/partition_table/Kconfig.projbuild \
	/home/Alext/esp/esp-idf/Kconfig

include/config/auto.conf: \
	$(deps_config)

ifneq "$(IDF_CMAKE)" "n"
include/config/auto.conf: FORCE
endif

$(deps_config): ;
