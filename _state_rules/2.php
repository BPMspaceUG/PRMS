<?php
    $allow = [];
    $msg = "";

    //--- Input
    $prjname = $param["row"]["prms_project_name"];
    $prjdesc = $param["row"]["prms_project_description"];
	$prjbudg = (int)$param["row"]["prms_project_budget"];

    //--- Input
    $history = $param["row"]["prms_project_history"];    
    $newval1 = $param["row"]["prms_project_name"];
    $newval2 = substr($param["row"]["prms_project_description"], 0, 30).'...';
    $newval3 = $param["row"]["prms_project_budget"];
    // Append Changes
    $who = trim($param["token"]->firstname . " " . $param["token"]->lastname);
    $history = "<small>[".date("Y-m-d H:i:s")."] $who changed prms_project_name &rarr; $newval1, prms_project_description &rarr; $newval2, prms_project_budget &rarr; $newval3!</small></br>".$history;
    $param["row"]["prms_project_history"] = $history;
    //--------------------------


    // Check if name is not empty
    $allowThis = (!empty($prjname));
    if (!$allowThis) $msg .= "Name can not be empty!<br>";
    $allow[] = $allowThis;

    // Check if Description is not empty
    $allowThis = (!empty($prjdesc));
    if (!$allowThis) $msg .= "Description can not be empty!<br>";
    $allow[] = $allowThis;

    // Check if Budget > 0
    $allowThis = ($prjbudg > 0);
    if (!$allowThis) $msg .= "Budget has to be > 0!<br>";
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