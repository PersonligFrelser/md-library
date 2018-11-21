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

namespace src\domain;


class Book {
    private $isbn;
    public $title;
    private $desc;
    private $img;

    /**
     * Book constructor.
     * @param array $book_row
     */
    public function __construct(array $book_row) {
        $this->isbn = $book_row["isbn"];
        $this->title = $book_row["title"];
        $this->desc = $book_row["desc"];
        $this->img = $book_row["img"];
    }

    public function getIsbn() {
        return $this->isbn;
    }

    public function getTitle() {
        return $this->title;
    }

    public function getDesc() {
        return $this->desc;
    }

    public function getImg() {
        return $this->img;
    }


}