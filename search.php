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

use src\tpl\Template;
use src\domain\Book;
require_once('global.php');

$user = unserialize($_SESSION['account']);

$tpl = new Template(TPL_DIR . 'search.tpl');
$tpl->assign('nav', Template::showNav($user));
$totalBooksFound = 0;
$tpl->assign('total_books_found', $totalBooksFound . (($totalBooksFound > 1 || $totalBooksFound == 0) ? ' Books Found' : ' Book Found'));
$tpl->assign('books', null);
$tpl->view();

if (isset($_REQUEST['q'])) {
    echo "<script>getBooks({$_REQUEST['q']})</script>";
}