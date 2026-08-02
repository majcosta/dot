wine() {
    local logdir="$HOME/winelog"
    local logfile="$logdir/$(date +'%Y%m%d_%H%M%S').log"

    mkdir -p "$logdir"

    command wine "$@" 2>"$logfile"
    local status=$?

    find "$logdir" -maxdepth 1 -type f -name '*.log' -printf '%T@ %p\n' |
        sort -nr |
        tail -n +6 |
        cut -d' ' -f2- |
        xargs -r rm -f --

    return $status
}
