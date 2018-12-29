namespace eval byRetry {
proc set_retry {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(retry:byRetry:retry) $attr
}

proc get_retry {p_generic} {
    upvar #0 $p_generic generic

    return $generic(retry:byRetry:retry)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(retry:byRetry:retry) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(retry:byRetry:retry)
}

proc getattrname {} {
    return "retry"
}
}
