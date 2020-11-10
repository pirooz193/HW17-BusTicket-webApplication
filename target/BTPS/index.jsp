<%@ page import="ir.maktab.service.AccountService" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ورود</title>
    <link rel="shortcut icon" type="image/x-icon" href="https://img.icons8.com/emoji/48/000000/bus-emoji.png"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="login.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <div class="d-flex justify-content-center h-100">
        <div class="card">
            <div class="card-header">
                <h3>ورود</h3>
                <div class="d-flex justify-content-end social_icon">
                    <span><i class="fab fa-facebook-square"></i></span>
                    <span><i class="fab fa-google-plus-square"></i></span>
                    <span><i class="fab fa-twitter-square"></i></span>
                </div>
            </div>
            <div class="card-body">
                <form action="<%--./logIn--%>" method="post">
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" class="form-control" placeholder="نام کاربری" name="username">

                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key" name="password"></i></span>
                        </div>
                        <input type="password" class="form-control" placeholder="رمز عبور">
                    </div>

                    <%
                        String username = request.getParameter("username");
                        String password = request.getParameter("password");
                        AccountService accountService = new AccountService();
                        if (accountService.getAccount(username, password).isEmpty()) {
                    %>
                    <button type="button" class="btn btn-primary" data-toggle="modal"
                            data-target=".bd-example-modal-lg">Large modal
                    </button>

                    <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
                         aria-labelledby="myLargeModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                Wrong Username Or Password!
                            </div>
                        </div>
                    </div>

                    <%
                        }
                    %>

                    <div class="row align-items-center remember">
                        <input type="checkbox">یادآوری کن
                    </div>
                    <div class="form-group">
                        <input type="submit" value="ورود" class="btn float-right login_btn">
                    </div>
                </form>
            </div>
            <div class="card-footer">
                <div class="d-flex justify-content-center links">
                    حساب کاربری ندارید؟<a href="signUp.html">ثبت نام</a>
                </div>
                <div class="d-flex justify-content-center">
                    <a href="#">رمز عبور خود را فراموش کرده ام</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>