<?php
/**
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
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

    use src\tpl\Template;
    use src\Header;
    require_once('./global.php');

    $tpl = new Template(TPL_DIR . 'index.tpl');
    $tpl->assign('nav', Template::showNav((isset($_SESSION['account'])) ? unserialize($_SESSION['account']) : null));
    $tpl->assign('search_path', '/search.php');
    $tpl->assign('search_placeholder', 'Harry Potter and the Dwarfs, etc...');
    $tpl->assign('email_col_placeholder', 'john@example.com');
    $tpl->assign('footer', file_get_contents(TPL_DIR . 'footer.tpl'));


    $tpl->view();


    function showUserBar($username, $avatar) {
        return <<<HTML
            <!-- Profile dropdown menu -->
            <li class="materialize-red" style="width: 196px !important;">
                <a class="waves-effect waves-block waves-light profile-button dropdown-trigger" data-target="profile-dropdown">
                    <img class="responsive-img circle avatar" src="{$avatar}">
                    <spar id="username-text">{$username}</spar>
                </a>
            </li>
HTML;
    }

    function showUserBarDropdown() {
        return <<<HTML
            <ul id="profile-dropdown" class="dropdown-content">
                <li><a href="#" class="grey-text text-darken-1"><i class="material-icons left">dashboard</i>Dashboard</a></li>    
                <li><a href="#" class="grey-text text-darken-1"><i class="material-icons left">face</i>My Account</a></li>
                <li><a href="#" class="grey-text text-darken-1"><i class="material-icons left">supervised_user_circle</i>Admin Portal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li> 
                <li><a href="./logout.php" class="grey-text text-darken-1"><i class="material-icons left">keyboard_tab</i>Log Out</a></li>   
            </ul>
HTML;

    }

    function showGuestBar() {
        return <<<HTML
            <li class="materialize-red"><a href="./login.php">Register / Login</a></li>
HTML;
    }