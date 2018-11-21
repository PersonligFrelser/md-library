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

namespace src\tpl;

class Template {
    public $file;
    public $map = array();

    public function __construct($path) {
        if (file_exists($path)) {
            $this->file = file_get_contents($path);
        } else {
            //TODO: Log this
        }
    }

    public function assign($key, $value) {
        // Format example: 'var' -> {VAR}
        $this->map['{' . strtoupper($key) . '}'] = $value;
    }

    public function view() {
        foreach ($this->map as $key => $value) {
            $this->file = str_replace($key, $value, $this->file);
        }
        echo $this->file;
    }
}