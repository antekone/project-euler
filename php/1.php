<?php
// project euler #1 in php by antekone
// http://anadoxin.org/blog
//
// usage:
//
// $ php 1.php

$sum = 0;
for($i = 0; $i < 1000; $i++) {
    if($i % 5 == 0 || $i % 3 == 0) {
        $sum += $i;
    }
}

echo($sum . "\n");

?>
