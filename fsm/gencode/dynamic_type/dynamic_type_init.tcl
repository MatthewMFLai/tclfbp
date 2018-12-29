proc init_FsmMgr {p_node} {

    byFSMs::init_whole $p_node
}

proc init_Fsm {p_node} {

    byCurNode::init_entity $p_node
    byState::init_whole $p_node
    byFSMs::init_part_new $p_node
    byFsm::init $p_node
}

proc init_Node {p_node} {

    byTransition::graph_init_vertex $p_node
    byState::init_part_new $p_node
    byNode::init $p_node
}

proc init_Link {p_node} {

    byTransition::graph_init_edge $p_node
    byLink::init $p_node
}

