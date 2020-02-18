<?php
    $allow = [];
    $msg = "";

    //--- Input
    $prjname = $param["row"]["prms_project_name"];
    $prjdesc = $param["row"]["prms_project_description"];

    // Check if name is not empty
    $allowThis = (!empty($prjname));
    if (!$allowThis) $msg .= "Name can not be empty!<br>";
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