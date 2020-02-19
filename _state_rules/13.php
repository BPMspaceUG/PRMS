<?php
    $allow = [];
    $msg = "";

    //--- Input
    $history = $param["row"]["prms_task_history"];    
    $newval1 = $param["row"]["prms_task_name"];
    $newval2 = substr($param["row"]["prms_task_description"], 0, 30).'...';
    // Append Changes
    $who = trim($param["token"]->firstname . " " . $param["token"]->lastname);
    $history = "<small>[".date("Y-m-d H:i:s")."] $who changed name &rarr; $newval1, description &rarr; $newval2!</small></br>".$history;
    $param["row"]["prms_task_history"] = $history;
    //--------------------------


    //--- Input
    $prjname = $param["row"]["prms_task_name"];
    $prjdesc = $param["row"]["prms_task_description"];

    // Check if name is not empty
    $allowThis = (!empty($prjname));
    if (!$allowThis) $msg .= "Name can not be empty!<br>";
    $allow[] = $allowThis;

    // Check if name is not empty
    $allowThis = (!empty($prjdesc));
    if (!$allowThis) $msg .= "Description can not be empty!<br>";
    $allow[] = $allowThis;

    // Check Description
    $minLen = 100;
    if (strlen($prjdesc) > 0) {
        $allowThis = (strlen($prjdesc) >= $minLen);
        if (!$allowThis) $msg .= "Description must have min. $minLen Chars!<br>";
    }
    $allow[] = $allowThis;

    //--- Output
    $script_result = [
        "allow_transition" => array_unique($allow)[0] === true && count(array_unique($allow)) === 1,
        "show_message" => strlen($msg) > 0,
        "message" => $msg
    ];