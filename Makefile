include output/Makefile

output/Makefile:
	make -C ../buildroot BR2_EXTERNAL=../br-containers O=../br-containers/output alldefconfig

clean:
	rm -r output/

.PHONY: clean
