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
use src\tpl\Template;

if (!isLoggedIn()) {
    header('Location: /');
}

$user = unserialize($_SESSION['account']);

$main = new Template(ADM_TPL_DIR . "main.tpl");
$main->assign('nav', Template::showNav($user));
$main->assign('user_name', $user->getUsername());
$main->assign('user_role', 'Administrator');
$main->assign('user_avatar', $user->getAvatar());

$tpl = new Template(ADM_TPL_DIR . "dashboard.tpl");
$tpl->assign("username", $user->getUsername());

$main->assign("content", $tpl->generateDocument());
$main->view();

