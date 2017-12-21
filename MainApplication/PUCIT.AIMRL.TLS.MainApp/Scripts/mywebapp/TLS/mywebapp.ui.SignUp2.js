

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
            window.location.href = "/TLS/Registration/SignUp3";

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
