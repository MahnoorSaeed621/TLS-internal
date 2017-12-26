

MyWebApp.namespace("UI.SignUp2");

MyWebApp.UI.SignUp2 = (function () {
    "use strict";
    var _isInitialized = false;


    function initialisePage() {

        $('#AddressLine1TextBox').blur(function () {
            verifyAddressLine1();
        });
        $('#AddressLine2TextBox').blur(function () {
            verifyAddressLine2();
        });

        $('#PostalCodeTextBox').blur(function () {
            verifyPostalCode();
        });

        $('#CNICTextBox').blur(function () {
            verifyCNIC();
        });
        $('#CellTextBox').blur(function () {
            verifyCell();
        });

        

        if (_isInitialized == false) {
            _isInitialized = true;
            BindEvents();
        }
    }//End of initialisePage

    function BindEvents() {

        $('#btn-next').click(function (e) {
            //if (validateData()) {
            saveData();
            loadNextPage();
            //}
            return false;
        });

    }

    function loadNextPage() {

        debugger;

        var user = JSON.parse(localStorage.getItem('user'));

        if (user.usertype == 'Lawyer')
            window.location.href = "/TLS/TLS/SignUp3";

    }

    function validateData() {

    }
    function verifyAddressLine1() {

        if ($.trim($('#AddressLine1TextBox').val()) == "") {
            MyWebApp.UI.showRoasterMessage("You must enter address line 1", Enums.MessageType.Error);
            $('#AddressLine1TextBox').focus();
            return;
        }
    }
    function verifyAddressLine2() {

        if ($.trim($('#AddressLine2TextBox').val()) == "") {
            MyWebApp.UI.showRoasterMessage("You must enter address line 2", Enums.MessageType.Error);
            $('#AddressLine2TextBox').focus();
            return;
        }
    }
    function verifyPostalCode() {

        if ($.trim($('#PostalCodeTextBox').val()) == "") {
            MyWebApp.UI.showRoasterMessage("You must enter postal code", Enums.MessageType.Error);
            $('#PostalCodeTextBox').focus();
            return;
        }
    }
    function verifyCNIC() {

        if ($.trim($('#CNICTextBox').val()) == "") {
            MyWebApp.UI.showRoasterMessage("You must enter address CNIC", Enums.MessageType.Error);
            $('#CNICTextBox').focus();
            return;
        }
    }
    function verifyCell() {

        if ($.trim($('#CellTextBox').val()) == "") {
            MyWebApp.UI.showRoasterMessage("You must enter address Cell Number", Enums.MessageType.Error);
            $('#CellTextBox').focus();
            return;
        }
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
        
        var DOB = new Date();
        var day = $("#day").val();
        var month = $("#month").val();
        var Year = $("#year").val();
        DOB.setFullYear(Year,month, day);
       

        var page2SignUpData = {
            Line1: adress1,
            Line2: adress2,
            CityName: city,
            PostalCode: postalCode,
            ProvinceName: province,
            DOB: DOB,
            CNIC : CNIC,
            cellNo: cellNo,
        }

        localStorage.setItem('page2SignUpData', page2SignUpData);

    }

    return {

        readyMain: function () {
            debugger;
            initialisePage();
        }
    };


}());
