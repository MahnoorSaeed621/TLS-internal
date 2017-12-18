﻿

MyWebApp.namespace("UI.SignUp2");

MyWebApp.UI.SignUp2 = (function () {
    "use strict";
    var _isInitialized = false;


    function initialisePage() {

        if (_isInitialized == false) {
            _isInitialized = true;
            BindEvents();
        }
    }//End of initialisePage

    function BindEvents() {

        $('#btn-next').click(function (e) {
            //if (validateData()) {
            //saveData();
            loadNextPage();
            //}
            return false;
        });

    }

    function loadNextPage() {
        alert("in load next");

        debugger;
        window.location.href = "/TLS/TLS/SignUp3";
    }

    function validateData() {

    }

    function saveData() {
        debugger;

        var adress1 = $("#addressline1").val();
        var adress2 = $("#addressline2").val();
        var province = $("#province").val();
        var city = $("#city").val();
        var postalCode = $("#postalcode").val();
        var CNIC = $("#CNIC").val();
        var cellNo = $("#cell").val();
        var day = $("#day").val();
        var month = $("#month").val();
        var Year = $("#year").val();


        //btn-next


        var UserObj = {
            FName: fname,
            LName: lname,
            Gender: gender,
            UserType: usertype,
            Password: password,
            Email: email
        }

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
