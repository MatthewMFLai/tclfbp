proc set_filename {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&filename) $attr
}

proc get_filename {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&filename)
}

proc set_state {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&state) $attr
}

proc get_state {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&state)
}

proc set_high_52 {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&high_52) $attr
}

proc get_high_52 {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&high_52)
}

proc set_low_52 {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&low_52) $attr
}

proc get_low_52 {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&low_52)
}

proc set_shares_outstanding {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&shares_outstanding) $attr
}

proc get_shares_outstanding {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&shares_outstanding)
}

proc set_dividend_yield {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&dividend_yield) $attr
}

proc get_dividend_yield {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&dividend_yield)
}

proc set_market_value {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&market_value) $attr
}

proc get_market_value {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&market_value)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(&filename) ""
    set generic(&state) ""
    set generic(&high_52) ""
    set generic(&low_52) ""
    set generic(&shares_outstanding) ""
    set generic(&dividend_yield) ""
    set generic(&market_value) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(&filename)
    unset generic(&state)
    unset generic(&high_52)
    unset generic(&low_52)
    unset generic(&shares_outstanding)
    unset generic(&dividend_yield)
    unset generic(&market_value)
}

proc getattrname {} {
    return "filename state high_52 low_52 shares_outstanding dividend_yield market_value"
}