<?php

require_once "../services/RiasecService.php";

$service = new RiasecService();

$scores = $service->calculerScores(1);

echo "<pre>";
print_r($scores);
echo "</pre>";