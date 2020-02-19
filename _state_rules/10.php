<?php
    //--- Input
    $history = $param["row"]["prms_task_history"];    
    $newval1 = $param["row"]["prms_task_name"];
    $newval2 = substr($param["row"]["prms_task_description"], 0, 30).'...';
    // Append Changes
    $who = trim($param["token"]->firstname . " " . $param["token"]->lastname);
    $history = "<small>[".date("Y-m-d H:i:s")."] $who changed name &rarr; $newval1, description &rarr; $newval2!</small></br>".$history;
    $param["row"]["prms_task_history"] = $history;
    //--------------------------