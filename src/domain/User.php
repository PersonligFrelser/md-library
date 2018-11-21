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
 * @author    PersonligFrelser
 * @copyright 2018
 * @license   http://www.apache.org/licenses/LICENSE-2.0
 */

namespace src\domain;


class User {
    private $uid;
    private $username;
    private $email;
    private $avatar;

    public function __construct(array $userRow) {
        $this->uid = $userRow['uid'];
        $this->username = $userRow['username'];
        $this->email = $userRow['email'];
        $this->avatar = $userRow['avatar'];
    }

    public function getUid() {
        return $this->uid;
    }

    public function getUsername() {
        return $this->username;
    }

    public function getEmail() {
        return $this->email;
    }

    public function getAvatar() {
        return $this->avatar;
    }
}