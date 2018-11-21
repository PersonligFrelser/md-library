<?php
/**
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * @author    PersonligFrelser
 * @copyright 2018
 * @license   http://www.apache.org/licenses/LICENSE-2.0
 */

use src\domain\User;

require_once('../global.php');

if (empty($_POST['username']) || empty($_POST['password'])) {
    echo "Please enter all fields.";
    exit;
}

$username = $con->real_escape_string(filter_var(strtolower($_POST['username']), FILTER_SANITIZE_STRING));
$password = sha1($_POST['password']);

$stmt = $con->prepare('SELECT uid, username, password, email, avatar FROM `user` WHERE username = ? LIMIT 1');
$stmt->bind_param("s", $username);

if ($stmt->execute()) {
    $res = $stmt->get_result();
    if ($res->num_rows == 1) {
        $row = $res->fetch_assoc();
       if ($row['password'] == $password) {
           $_SESSION['account'] = serialize(new User($row));
           echo "true";
           exit;
       } else {
           echo "Password is invalid.";
           exit;
       }
    } else {
        echo "User do not exist.";
        exit;
    }
} else {
    echo "Something went wrong. Please try again.";
}