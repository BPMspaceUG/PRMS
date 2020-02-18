<?php
    $allow = false;
    $msg = "";

    //--- Input
    $prjname = $param["row"]["prms_project_name"];
    $prjdesc = $param["row"]["prms_project_description"];
	$prjbudg = $param["row"]["prms_project_budget"];

    // Check if name is not empty
    $allow = (!empty($prjname));
    if (!$allow) $msg .= "Name can not be empty!<br>";

    // Check if Description is not empty
    $allow = (!empty($prjdesc));
    if (!$allow) $msg .= "Description can not be empty!<br>";

	// Check if Budget greater 0
    $allow = ($prjbudg > 0);
    if (!$allow) $msg .= "Budget has to be > 0!<br>";
	
    // Check Description
    $minLen = 100;
    if (strlen($prjdesc) > 0) {
        $allow = (strlen($prjdesc) >= $minLen);
        if (!$allow) $msg .= "Description must have min. $minLen Chars!<br>";
    }

    //--- Output
    $script_result = [
        "allow_transition" => $allow,
        "show_message" => strlen($msg) > 0,
        "message" => $msg
    ];