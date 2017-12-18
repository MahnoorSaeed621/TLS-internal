

MyWebApp.namespace("UI.ShowData");

MyWebApp.UI.ShowData = (function () {
    "use strict";
    var _isInitialized = false;


    function initialisePage() {

        if (_isInitialized == false) {
            _isInitialized = true;
            BindEvents();
        }
    }//End of initialisePage

    function BindEvents() {
        debugger;
        $('#submit').click(function (e) {
            showData();
            return false;
        });

    }

    function showData() {
        //alert("in show data");
        //debugger;

        var mail = $("#email").val();

        
        var url = "TLSInfo/getSampleUser/?mail="+mail;

        MyWebApp.Globals.MakeAjaxCall("GET", url, {}, function (result) {
            //
            //debugger;
            if (result.success == true) {
                debugger;
                $("#name").val(result.data.Name);
                console.log(result);
                alert(result.data.Name);
            }
            else {
                MyWebApp.UI.showRoasterMessage(result.error, Enums.NessageType.Error);
            }

        }, function (xhr, ajaxOptions, thrownError) {
            MyWebApp.UI.showRoasterMessage('A problem has occured while getting data: ' + thrownError + '", Please try Again."', Enums.MessageType.Error);
        });

    }

    return {

        readyMain: function () {
            initialisePage();
        }
    };


}());
