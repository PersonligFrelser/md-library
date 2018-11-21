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

    require_once('./global.php');
    use src\tpl\Template;

    if (isset($_SESSION['account'])) {
        header('Location: ./');
    }

    showRegister();

    function showRegister() {
        $tpl = new Template(TPL_DIR . 'register.tpl');
        $tpl->assign("register_script", regScript("http://localhost/requests/register.php"));
        $tpl->view();
    }

    function regScript($loc) {
        return <<<JS
            function register() {
                    if (document.getElementById("user_input").value == "" ||
                        document.getElementById("email_input").value == "" ||
                        document.getElementById("pw_input").value == "" ||
                        document.getElementById("cpw_input").value == "") {
                        M.toast({html: "Please enter all fields"});
                    } else {
                        if (window.XMLHttpRequest) {
                            req = new XMLHttpRequest();
                        }
            
                        req.onreadystatechange = function () {
                            if (this.readyState == 4 && this.status == 200) {
                                M.toast({html: req.responseText});
                            }
                        };
                        
                        let username = document.getElementById("user_input").value;
                        let email = document.getElementById("email_input").value;
                        let password = document.getElementById("pw_input").value;
                        let cpassword = document.getElementById("cpw_input").value;
                        
                        var payload = "email=" + email + "&username=" + username + "&password=" + password + "&cpassword=" + cpassword;
                        
                        req.open("POST", "{$loc}", true);
                        req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
                        req.send(payload);
                    }
                }
JS;
    }




