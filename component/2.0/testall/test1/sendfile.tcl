proc send_one_file {name host port} {
    set size [file size $name]
    set fp [open $name r]
    fconfigure $fp -translation binary

    set channel [socket $host $port]
    fconfigure $channel -translation binary
    # Strip the directory prefix from file name.
    set idx [string last "/" $name]
    incr idx
    set filename [string range $name $idx end]
    puts $channel [list $filename $size]

    fcopy $fp $channel -size $size

    close $fp
    close $channel
}
