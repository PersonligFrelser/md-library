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

require_once('../global.php');

    if (empty($_POST['username']) ||
        empty($_POST['email']) ||
        empty($_POST['password']) ||
        empty($_POST['cpassword'])) {
            echo "Please enter all fields.";
            exit;
    }

    $username = $con->real_escape_string(filter_var($_POST['username'], FILTER_SANITIZE_STRING));
    $email = $con->real_escape_string(filter_var($_POST['email'], FILTER_SANITIZE_EMAIL));
    $password = $_POST['password'];

    if (strlen($password) < 6) {
        echo "Password must be longer than 6 characters.";
        exit;
    }

    $password = sha1($password);
    $cpassword = sha1($_POST['cpassword']);

    if ($password != $cpassword) {
        echo "Passwords do not match";
        exit;
    }

    $stmt = $con->prepare("SELECT username FROM user WHERE username = ? LIMIT 1");
    $stmt->bind_param("s", $username);

    if ($stmt->execute()) {
        if ($stmt->get_result()->num_rows == 1) {
            echo "Username already exists.";
            exit;
        }
    } else {
        echo "Something went wrong, please try again.";
        exit;
    }

    $stmt2 = $con->prepare("INSERT INTO user (username, password, email) VALUES(?, ?, ?)");
    $stmt2->bind_param("sss", $username, $password, $email);

    if ($stmt->execute()) {
        echo "Sucessfully registered!";
        exit;
    } else {
        echo "Couldn't create the user.";
    }
