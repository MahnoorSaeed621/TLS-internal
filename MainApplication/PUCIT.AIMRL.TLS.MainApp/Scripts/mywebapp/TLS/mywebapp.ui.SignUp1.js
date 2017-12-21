

MyWebApp.namespace("UI.SignUp1");

MyWebApp.UI.SignUp1 = (function () {
    "use strict";
    var _isInitialized = false;


    function initialisePage() {
      //  alert("in initialize");
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
        //alert("in load next");

        debugger;
        window.location.href = "/TLS/Registration/SignUp2";


    }

    function validateData() {
        alert('jazib pagal hai');
    }

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
