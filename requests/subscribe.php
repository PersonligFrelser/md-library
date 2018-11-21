<?php
/**
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 *  @author    PersonligFrelser
 *  @copyright 2018
 *  @license   http://www.apache.org/licenses/LICENSE-2.0
 */
use src\Header;
require_once('../global.php');
error_reporting(null);

// Assigns the email to a variable and checks if its empty
$email = $_POST['email'];
if (empty($email)) {
    exit;
}

// Checks if the email is valid
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo 'Not a valid email';
    exit;
}

// Prepares a query to check if the email is already subscribed
$email = $con->real_escape_string(filter_var($email, FILTER_SANITIZE_EMAIL, FILTER_VALIDATE_EMAIL));
$stmt = $con->prepare("SELECT email FROM subscription WHERE email = ? LIMIT 1");
$stmt->bind_param("s", $email);

// Tries to execute the query
if ($stmt->execute()) {
    // Query went though
    if ($stmt->get_result()->num_rows == 1) {
        // Already subscribed
        echo 'You are already subscribed';
        exit;
    }
}

// Query to add the email to sub list
$stmtInsert = $con->prepare("INSERT INTO subscription(`email`) VALUES(?)");
$stmtInsert->bind_param("s", $email);

if ($stmtInsert->execute()) {
    // Successfully subscribed
    echo 'Successfully subscribed!';
} else {
    // Unable to subscribe
    echo 'Couldn\'t subscribe, please try again';
}

