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

    use src\domain\User;
    use src\tpl\Template;

    require_once('./global.php');

    if (isset($_SESSION['account'])) {
        header('Location: /');
    }

    showLogin();


    function showLogin() {
        $tpl = new Template(TPL_DIR . 'login.tpl');
        $tpl->assign('login_script', loginScript("http://localhost/requests/login.php"));
        $tpl->view();
    }

function loginScript($loc) {
    return <<<JS
            function login() {
                    if (document.getElementById("user_input").value == "" || document.getElementById("pw_input").value == "") {
                        M.toast({html: "Please enter all fields"});
                    } else {
                        if (window.XMLHttpRequest) {
                            req = new XMLHttpRequest();
                        }
            
                        req.onreadystatechange = function () {
                            if (this.readyState == 4 && this.status == 200) {
                                if (req.responseText = "true") {
                                    window.location = "http://localhost/";
                                } else {
                                    M.toast({html: req.responseText});
                                }
                            }
                        };
                        
                        let username = document.getElementById("user_input").value;
                        let password = document.getElementById("pw_input").value;
                        
                        var payload = "username=" + username + "&password=" + password;
                        
                        req.open("POST", "{$loc}", true);
                        req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
                        req.send(payload);
                    }
                }
JS;
}