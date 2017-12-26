

MyWebApp.namespace("UI.SignUp1");

MyWebApp.UI.SignUp1 = (function () {
    "use strict";
    var _isInitialized = false;


    function initialisePage() {
<<<<<<< HEAD
        alert("in initialize");

        
        $('#emailAddressTextBox').blur(function () {
            verifyEmail();
        });
        $('#gender').blur(function () {
            verifyGender();
        });
        $('#UsernameTextBox').blur(function () {
            verifyUserName();
        });

        $('#UserLastnameTextBox').blur(function () {
            verifyUserlastName();
        });

        $('#PasswordTextBox').blur(function () {
            verifyPassword();
        });
        $('#ConfirmPasswordTextBox').blur(function () {
            verifyConfirmPassword();
        });

=======
      //  alert("in initialize");
>>>>>>> c577c8b817152eff18cc6c02bfb4ee1bad6fe58c
        debugger;
        if (_isInitialized == false) {
            _isInitialized = true;
            BindEvents();
        }
    }//End of initialisePage

    function BindEvents() {
        //alert("in bindevent");

        $('#submit').click(function (e) {
            //if (validateData())
            //{
            saveData();
            loadNextPage();
            //}
            return false;
        });

    }

    function loadNextPage() {
<<<<<<< HEAD
        if (document.getElementsByName("gender").value == undefined) {
            MyWebApp.UI.showRoasterMessage("You must enter a user name.", Enums.MessageType.Error);
            $('#gender').focus();

            alert("Null");
        }
            alert("in load next");
=======
        //alert("in load next");
>>>>>>> c577c8b817152eff18cc6c02bfb4ee1bad6fe58c

        debugger;
        window.location.href = "/TLS/TLS/SignUp2";

<<<<<<< HEAD
        //"@Url.Action("Action", "Controller")";

        //var url = "/TLS/TLS/SignUp2";

        //$.ajax({
        //    url: url
        //})

        ///////////
        //$.ajax({
        //    url: url,
        //    data: JSON.stringify({ a: "a", b: "b" }), //Two String Parameters
        //    type: 'GET',                              //For Submit, use POST
        //    contentType: 'application/json, charset=utf-8',
        //    dataType: 'json'
        //}).done(function (data) {
        //    //Success Callback
        //}).fail(function (data) {
        //    //Failed Callback        
        //}).always(function (data) {
        //    //Request completed Callback
        //});
=======
>>>>>>> c577c8b817152eff18cc6c02bfb4ee1bad6fe58c

    }

    function validateData() {
        alert('jazib pagal hai');
    }
    function verifyGender() {

        if ($('#gender').val() == undefined) {
            MyWebApp.UI.showRoasterMessage("You must Select Gender.", Enums.MessageType.Error);
            $('#gender').focus();
            return;
        }
    }
    function verifyUserName() {

        if ($.trim($('#UsernameTextBox').val()) == "") {
            MyWebApp.UI.showRoasterMessage("You must enter a user name.", Enums.MessageType.Error);
            $('#UsernameTextBox').focus();
            return;
        }
    }

    function verifyUserlastName() {

        if ($.trim($('#UserLastnameTextBox').val()) == "") {
            MyWebApp.UI.showRoasterMessage("You must enter a last name.", Enums.MessageType.Error);
            $('#UserLastnameTextBox').focus();
            return;
        }
    }
    function verifyEmail() {

        if ($.trim($('#emailAddressTextBox').val()) == "") {
            MyWebApp.UI.showRoasterMessage("You must enter an email address", Enums.MessageType.Error);
            $('#emailAddressTextBox').focus();
            return;
        }
        else if (isValidEmailAddress($.trim($('#emailAddressTextBox').val())) == false) {
            MyWebApp.UI.showRoasterMessage("Invalid Email address", Enums.MessageType.Error);
            $('#emailAddressTextBox').focus();
            return;
        }
    }
    
    function isValidEmailAddress(emailAddress) {
        var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
        return pattern.test(emailAddress);
    }

    function verifyPassword() {

        if ($.trim($('#PasswordTextBox').val().length < 6)) {
            MyWebApp.UI.showRoasterMessage("You must enter atleast 6 characters password", Enums.MessageType.Error);
            $('#PasswordTextBox').focus();
            return;
        }
    }
    function verifyConfirmPassword() {

        if ($.trim($('#PasswordTextBox').val()) != $.trim($('#ConfirmPasswordTextBox').val())) {
            MyWebApp.UI.showRoasterMessage("Password missmatched", Enums.MessageType.Error);
            $('#ConfirmPasswordTextBox').focus();
            return;
        }
    }
        /*if ($.trim($('#UsernameTextBox').val()) == "") {
            alert("dhfds");
            $("#spusernamestatus").hide();
            return false;
        }
        //debugger;
        var url = "UserInfoData/VerifyUserName/?pDataToVerify=" + $.trim($('#UsernameTextBox').val());

        MyWebApp.UI.showMessage("#spusernamestatus", "Processing...", Enums.MessageType.Loading);

        MyWebApp.Globals.MakeAjaxCall("GET", url, "{}", function (data) {
            //debugger;
            if (data == "Error")
            { return false; }



            if (data.Result == true) {
                MyWebApp.UI.showMessage("#spusernamestatus", "User with User Name '" + data.UserName + "' already exists!", Enums.MessageType.Error);
            }
            else {
                MyWebApp.UI.showMessage("#spusernamestatus", "Available", Enums.MessageType.Success);
            }
        });
   */ 

    function saveData() {
        debugger;

        //getting data from fields
        var email = $("#email").val();
        var gender = $("#gender").val();
        var fname = $("#fname").val();
        var lname = $("#lname").val();
        var password = $("#password").val();
        var usertype = $("#usertype").val();

        //JS object for storing data
        var user = {
            FirstName: fname,
            LastName: lname,
            Gender :gender,
            UserType :usertype,
            Password : password,
            Email: email,
            Gender: "",
            DateOfBirth: "",
            Cnic: "",
            CellNo: ""
        }

        //saving data on local storage
        localStorage.setItem('user', JSON.stringify(user));




    }

    return {

        readyMain: function () {
            debugger;
            initialisePage();
        }
    };


}());
