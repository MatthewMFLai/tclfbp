proc init_ContentMain {p_node} {

    byTitle::init_whole $p_node
    byAuthor::init_whole $p_node
    byAllWords::init_whole $p_node
}

proc init_Author {p_node} {

    byAuthor::init_part_new $p_node
    byAuthor_Title::init_whole $p_node
    byText::init $p_node
}

proc init_Title {p_node} {

    byTitle::init_part_new $p_node
    byAuthor_Title::init_part_new $p_node
    byText::init $p_node
    byLocalMeaning::init_whole $p_node
    byTokens::init_node $p_node
}

proc init_ContextMean {p_node} {

    byText::init $p_node
    byLocalMeaning::init_part_new $p_node
}

proc init_Token {p_node} {

    byText::init $p_node
    byTokens::init_node $p_node
}

proc init_Connect {p_node} {

    byConnect::graph_init_edge $p_node
    byText::init $p_node
    byTokens::init_node $p_node
}

proc init_Word {p_node} {

    byText::init $p_node
    byAllWords::init_part_new $p_node
    byConnect::graph_init_vertex $p_node
}

