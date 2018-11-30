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

require_once("../global.php");
preg_match('/"books":(.*}})}/', file_get_contents("http://www.librarything.com/api_getdata.php?max=20&userid=123"), $reg);
$json = substr($reg[0], 8, (strlen($reg[0]) - 9));

if ($json == null) {
    echo "Something went wrong...";
    exit;
}

$check_book = $con->prepare("SELECT 1 FROM book WHERE isbn = ?");
$add_book = $con->prepare("INSERT INTO book VALUES (?, ?, ?, ?, ?, ?)");

$check_author = $con->prepare("SELECT id FROM author WHERE author_code = ?");
$add_author = $con->prepare("INSERT INTO author VALUES (DEFAULT, ?, ?, DEFAULT ,? ,?)");

$check_publisher = $con->prepare("SELECT id FROM publisher WHERE name = ?");
$add_publisher = $con->prepare("INSERT INTO publisher VALUES (DEFAULT, ?, ?, 1900)");

$add_book_writer = $con->prepare("INSERT INTO book_writer VALUES (?, ?)");

foreach (json_decode($json) as $el) {
    $book_isbn = 0;
    $author_id = 0;
    $publisher_id = 0;

    $check_book->bind_param("i", $el->book_id);
    if ($check_book->execute()) {
        if ($check_book->get_result()->num_rows == 0) {
            $check_author->bind_param("s", $el->author_fl);
            if ($check_author->execute()) {
                $author_res = $check_author->get_result();
                if ($author_res->num_rows == 1) {
                    $author_id = $author_res['id'];
                } else {
                    $email = $el->author_code . "@gmail.com";
                    $add_author->bind_param("ssis", $el->author_fl, $email, $el->entry_stamp, "Russian");
                }
            }
        } else {
            echo 'Already exists.';
        }
    } else {
        echo "Error.";
        exit;
    }
}

function execute_and_get_author_id(mysqli_stmt $stmt, $fullname) : int {
    $stmt->bind_param("s", $fullname);
    if ($stmt->execute()) {
        $res = $stmt->get_result();
        if ($res->num_rows > 0) {
            return $res->fetch_all(MYSQLI_ASSOC)["id"];
        } else {
            return null;
        }
    } else {
        return null;
    }
}