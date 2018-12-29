proc set_state {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&state) $attr
}

proc get_state {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&state)
}

proc set_symbol {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&symbol) $attr
}

proc get_symbol {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&symbol)
}

proc set_filename {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&filename) $attr
}

proc get_filename {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&filename)
}

proc set_fiscal_year_end {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&fiscal_year_end) $attr
}

proc get_fiscal_year_end {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&fiscal_year_end)
}

proc set_price_book_recent {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&price_book_recent) $attr
}

proc get_price_book_recent {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&price_book_recent)
}

proc set_price_book_mra {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&price_book_mra) $attr
}

proc get_price_book_mra {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&price_book_mra)
}

proc set_roe {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&roe) $attr
}

proc get_roe {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&roe)
}

proc set_roa {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&roa) $attr
}

proc get_roa {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&roa)
}

proc set_debt_eq {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&debt_eq) $attr
}

proc get_debt_eq {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&debt_eq)
}

proc set_interest_coverage {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&interest_coverage) $attr
}

proc get_interest_coverage {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&interest_coverage)
}

proc set_div_payout {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&div_payout) $attr
}

proc get_div_payout {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&div_payout)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(&state) ""
    set generic(&symbol) ""
    set generic(&filename) ""
    set generic(&fiscal_year_end) ""
    set generic(&price_book_recent) ""
    set generic(&price_book_mra) ""
    set generic(&roe) ""
    set generic(&roa) ""
    set generic(&debt_eq) ""
    set generic(&interest_coverage) ""
    set generic(&div_payout) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(&state)
    unset generic(&symbol)
    unset generic(&filename)
    unset generic(&fiscal_year_end)
    unset generic(&price_book_recent)
    unset generic(&price_book_mra)
    unset generic(&roe)
    unset generic(&roa)
    unset generic(&debt_eq)
    unset generic(&interest_coverage)
    unset generic(&div_payout)
}

proc getattrname {} {
    return "state symbol filename fiscal_year_end price_book_recent price_book_mra roe roa debt_eq interest_coverage div_payout"
}