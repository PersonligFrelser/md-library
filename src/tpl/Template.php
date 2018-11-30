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

use src\domain\User;

class Template {
    public $file;
    public $map = array();

    public function __construct($path) {
        if (file_exists($path)) {
            $this->file = file_get_contents($path);
        } else {
            //TODO: Log this
            echo "Template file failed to load.";
            exit;
        }
    }

    public function assign($key, $value) {
        // Format example: 'var' -> {VAR}
        $this->map['{' . strtoupper($key) . '}'] = $value;
    }

    public function generateDocument() : String {
        foreach ($this->map as $key => $value) {
            $this->file = str_replace($key, $value, $this->file);
        }
        return $this->file;
    }

    public function view() {
        foreach ($this->map as $key => $value) {
            $this->file = str_replace($key, $value, $this->file);
        }
        echo $this->file;
    }

    // Loads navigation bar
    public static function showNav($user) : String {
        if (isset($user)) {
            return self::generateNavbar("Library", self::formatUserBar($user), self::formatDropDown());
        } else {
            return self::generateNavbar("Library", self::formatGuestBar());
        }
    }

    private static function formatGuestBar() : String {
        return '<li class="materialize-red"><a href="./login.php">Register / Login</a></li>';
    }

    private static function formatUserBar(User $user) : String {
        return <<< HTML
            <!-- Profile dropdown menu -->
            <li class="materialize-red" style="width: 196px !important;">
                <a class="waves-effect waves-block waves-light profile-button dropdown-trigger" data-target="profile-dropdown">
                    <img class="responsive-img circle avatar" src="{$user->getAvatar()}">
                    <spar id="username-text">{$user->getUsername()}</spar>
                </a>
            </li>
HTML;
    }

    private static function formatDropDown() : String {
        return <<<HTML
            <ul id="profile-dropdown" class="dropdown-content">
                <li><a href="#" class="grey-text text-darken-1"><i class="material-icons left">dashboard</i>Dashboard</a></li>    
                <li><a href="#" class="grey-text text-darken-1"><i class="material-icons left">face</i>My Account</a></li>
                <li><a href="../admin/" class="grey-text text-darken-1"><i class="material-icons left">supervised_user_circle</i>Admin Portal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li> 
                <li><a href="../logout.php" class="grey-text text-darken-1"><i class="material-icons left">keyboard_tab</i>Log Out</a></li>   
            </ul>
HTML;
    }

    private static function generateNavbar($title, $clientBar, $profileDropDown = '') : String {
        return <<< HTML
            <div class="navbar-fixed">
                <nav class="black z-depth-0">
                    <div class="container nav-wrapper">
                        <div>
                            <a href="/" class="brand-logo">{$title}</a>
                            <ul class="right hide-on-med-and-down" id="nav-mobile">
                                <li><a href="main.tpl">News</a></li>
                                <li><a href="main.tpl">Events</a></li>
                                <li><a href="main.tpl">About Us</a></li>
                                {$clientBar}
                            </ul>
                            {$profileDropDown}
                        </div>
                    </div>
                    <!-- Navigation underline -->
                    <div class="divider materialize-red"></div>
                </nav>
            </div>
HTML;

    }
}