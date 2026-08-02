function dot () # for managing the dot files bare repo
{
    git --git-dir="$HOME/.dot" --work-tree="$HOME" "$@"
}

function setgov ()
{
	echo "$1" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
}
