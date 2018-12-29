proc init_Main {p_node} {

    byMain_Block::init_whole $p_node
}

proc init_Block {p_node} {

    byBlock_InPort::init_whole $p_node
    byMain_Block::init_part_new $p_node
    byBlock_OutPort::init_whole $p_node
    byBlock_Portgrp::init_whole $p_node
    byBlock::init $p_node
    byBlock_Subcircuit::init_whole $p_node
    byBlock_Subcircuit::init_part_new $p_node
}

proc init_Port {p_node} {

    byBlock_InPort::init_part_new $p_node
    byBlock_OutPort::init_part_new $p_node
    byInPort_OutPort::init_entity $p_node
    byPort::init $p_node
    byVport_Port::init_entity $p_node
    byPortgrp_Port::init_part_new $p_node
}

proc init_Portgrp {p_node} {

    byBlock_Portgrp::init_part_new $p_node
    byPortgrp_Port::init_whole $p_node
    byPortgrp::init $p_node
}

