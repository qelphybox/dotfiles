prepare:
	sudo apt-get install software-properties-common
	sudo apt-add-repository -y ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install -y ansible git

common-software: dep
	ansible-playbook common-software.yml --ask-sudo-pass

TAGS := always
development: dep
	ansible-playbook development.yml --ask-sudo-pass --tags $(TAGS) -v

dotfiles:
	ansible-playbook dotfiles.yml --ask-sudo-pass

dep:
	ansible-galaxy install --force -r requirements.yml
