

MyWebApp.namespace("UI.SignUp3");

MyWebApp.UI.SignUp3 = (function () {
    alert("1");
    "use strict";
    var _isInitialized = false;


    function initialisePage() {
        alert("in initialize");

        $('#LicenseNoTextBox').blur(function () {
            verifyLicenseNo();
        });

        $('#ShortIntroTextBox').blur(function () {
            verifyShortIntro();
        });
        

        debugger;
        if (_isInitialized == false) {
            _isInitialized = true;
            BindEvents();
        }
    }//End of initialisePage

    function BindEvents() {
        alert("in bindevent");

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
        alert("in load next");

        debugger;
        window.location.href = "/TLS/TLS/SignUp2";

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

    }

    function verifyShortIntro() {

        if ($.trim($('#ShortIntroTextBox').val()) == "") {
            MyWebApp.UI.showRoasterMessage("You must enter Short Intro", Enums.MessageType.Error);
            $('#ShortIntroTextBox').focus();
            return;
        }
    }
    function verifyLicenseNo() {

        if ($.trim($('#LicenseNoTextBox').val()) == "") {
            MyWebApp.UI.showRoasterMessage("You must enter License No", Enums.MessageType.Error);
            $('#LicenseNoTextBox').focus();
            return;
        }
    }

    function validateData() {

    }

    function saveData() {
        debugger;



        var LicenseNo = $("#license no").val();
        var ShortIntro = $("#shortintro").val();
        var email = $("#email").val();
        var gender = $("#gender").val();
        var fname = $("#fname").val();
        var lname = $("#lname").val();
        var password = $("#password").val();
        var usertype = $("#usertype").val();
        //submit


        //var UserObj = {
        //    FName: fname,
        //    LName: lname,
        //    Gender :gender,
        //    UserType :usertype,
        //    Password : password,
        //    Email: email
        //}


        var UserObj = {
            FirstName: fname,
            LastName: lname,
            Gender: gender,
            UserType: usertype,
            Password: password,
            Email: email
        }

        //public class Users
        //{

        //[Key]
        //public int UserId { get; set; }
        //    public String Login { get; set; }
        //    public String Email { get; set; }
        //    public String Password { get; set; }
        //    public String FirstName { get; set; }
        //    public String LastName { get; set; }
        //    public int Gender { get; set; }
        //    public DateTime DateOfBirth { get; set; }
        //    public String Cnic { get; set; }
        //    public String CellNo { get; set; }
        //    public String LandLine { get; set; }
        //    public String ProfilePicture { get; set; }

        //}

        var dateToSend = JSON.stringify(UserObj);
        var url = "TLSInfo/saveUser";

        MyWebApp.Globals.MakeAjaxCall("POST", url, dateToSend, function (result) {
            //
            debugger;
            if (result.success == true) {
                console.log(result);
                alert("Data Saved successfully")
            }
            else {
                MyWebApp.UI.showRoasterMessage(result.error, Enums.NessageType.Error);
            }

        }, function (xhr, ajaxOptions, thrownError) {
            MyWebApp.UI.showRoasterMessage('A problem has occured while saving data: ' + thrownError + '", Please try Again."', Enums.MessageType.Error);
        });

    }

    return {

        readyMain: function () {
            debugger;
            initialisePage();
        }
    };


}());
