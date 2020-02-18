<?php
    $allow = false;
    $msg = "";

    //--- Input
    $prjID = (int)$param["row"]["prms_project_id"];
    $vParamSure = $param["row"]["are_you_sure"];
    $state_id = (int)$param["row"]["state_id"];

    // Check if User is really sure
    $allow = ($vParamSure === "yes_i_am_really_sure!");
    $script = "DB.request('makeTransition', {table: 'prms_project', row: {prms_project_id: ".$prjID.", are_you_sure: 'yes_i_am_really_sure!', state_id: ".$state_id."}}, r=>{ console.log(r); document.location.reload(); });";
    if (!$allow) $msg .= 'Are you sure? <a href="javascript:void(0);" onclick="'.$script.'" class="btn btn-warning ml-3">YES</a>';

    //--- Output
    $script_result = [
        "allow_transition" => $allow,
        "show_message" => strlen($msg) > 0,
        "message" => $msg
    ];