alias ls="ls -lah --color=auto"
alias grep='grep --color=auto'
alias emacs="emacs -nw"
alias _update="reflector --score 4 -f 2 > mirrorlist && sudo mv mirrorlist /etc/pacman.d/mirrorlist && paru -Syu --noconfirm"
alias rmorphans="sudo pacman -Qtdq | sudo pacman -Rns -"
alias gputemp="watch -n 1 sensors amdgpu-* nvme-pci-* coretemp-isa-*"
alias docker-rmstopped='docker rm $(docker ps -a -q)'
alias docker-rmi='docker rmi $(docker images -a -q)'
alias gpgsign="gpg --armor --clearsign --sign --output"
