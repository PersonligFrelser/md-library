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

header("Content-Type: application/json");
require_once("../../global.php");

const ALL = "all";
const PARTIAL = "partial";
const SINGLE = "single";
CONST EDIT = "edit";
CONST DELETE = "delete";

if (empty($_POST['type'])) {
    exit;
}

$type = strtolower($_POST['type']);

if ($type == ALL) {
    $stmt = $con->prepare("SELECT `uid`, `username` `firstname`, `lastname`, `email` FROM `user`");
    printJson($stmt);
} else if ($type == "partial") {
    if (isset($_POST['username'])) {
        $stmt = $con->prepare("SELECT `uid`, `username` `firstname`, `lastname`, `email` FROM `user` WHERE `username` LIKE CONCAT('%', ?, '%')");
        $stmt->bind_param("s", $_POST['username']);
        printJson($stmt);
    } else {
        echo "Please provide a username.";
    }
} else if ($type == SINGLE) {
    if (isset($_POST['uid'])) {
        $stmt = $con->prepare("SELECT `uid`, `username` `firstname`, `lastname`, `email` FROM `user` WHERE `uid` = ?");
        $stmt->bind_param("i", $_POST['uid']);
        printJson($stmt);
    } else {
        echo "Please provide a numeric user id.";
    }
}

function printJson(mysqli_stmt $stmt) {
    if ($stmt->execute()) {
        $res = $stmt->get_result();
        if ($res->num_rows > 0) {
            echo json_encode($res->fetch_all(MYSQLI_ASSOC));
        } else {
            echo "[]";
        }
    } else {
        echo "[]";
    }
}