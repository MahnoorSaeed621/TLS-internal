

MyWebApp.namespace("UI.Sample");

MyWebApp.UI.Sample = (function () {
    "use strict";
    var _isInitialized = false;


    function initialisePage() {

        if (_isInitialized == false) {
            _isInitialized = true;
            BindEvents();
        }
    }//End of initialisePage

    function BindEvents() {

        $('#submit').click(function (e) {
            saveData();
            return false;
        });

    }

    function saveData(){
        debugger;
        
        var name = $("#name").val();
        var mail = $("#email").val();

        var UserObj = {
            Name:  name,
            Email: mail
        }

        var dateToSend = JSON.stringify(UserObj);
        var url = "TLSInfo/saveSampleUser";

        MyWebApp.Globals.MakeAjaxCall("POST", url, dateToSend, function (result) {
            //
            debugger;
            if(result.success == true){
                console.log(result);
                alert("Data Saved successfully")
            }
            else{
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
