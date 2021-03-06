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
header("Content-Type: application/json");

if (empty($_REQUEST['q'])) {
    $queryString = "SELECT `isbn`, `title`, `img`, `desc` FROM `book`";
    $stmt = $con->prepare($queryString);
} else {
    $queryString = "SELECT `isbn`, `title`, `img`, `desc` FROM `book` WHERE `title` LIKE CONCAT('%', ?, '%')";
    $stmt = $con->prepare($queryString);
    $stmt->bind_param("s", $query);
    $query = $con->real_escape_string($_REQUEST['q']);
}

if ($stmt->execute()) {
    echo json_encode($stmt->get_result()->fetch_all(MYSQLI_ASSOC));
} else {
    // Query failed
    echo "[]";
}