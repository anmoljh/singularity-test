# Makefile for gcac-playbook

create_image: 
	singularity create --size 20480  gcac.img

install:
	sudo singularity bootstrap gcac.img gcac.def

run_playbook1:
	sudo singularity exec -w gcac.img \
        ansible-playbook -i localhost, -c local /opt/gcac/gcac-playbook/provisioning/galaxy-os-playbook1.yml	

run_playbook2:
	sudo singularity exec -w gcac.img \
	ansible-playbook -i localhost, -c local /opt/gcac/gcac-playbook/provisioning/galaxy-playbook2.yml

run_playbook3:
	sudo singularity exec -w gcac.img \
	ansible-playbook -i localhost, -c local /opt/gcac/gcac-playbook/provisioning/gcac-dependencies-playbook3.yml

run_playbook4:
	sudo singularity exec -w gcac.img \
	ansible-playbook -i localhost, -c local /opt/gcac/gcac-playbook/provisioning/galaxy-tools-playbook4.yml	

clean: 
	rm -f gcac.img

reinstall: clean install
