jQuery(document).on('ready', function () {
    $("#input-login").click(function (e) {
        LoginBennder.login();
        return false;
    });
    //aceptando numericos

    //.- restricciones caractéres
    $("#user-login,#password").alphanumeric({allow: ".-_@"});

    //.- enter 
    $("#user-login,#password").keyup(function (e) {
        if (e.keyCode === 13) {
            LoginBennder.login();
        }
    });

});

var LoginBennder = {    
    recuperacionPassword:function(){
        //.- validar formato
        $('#pwdModal').modal('hide');
        var u = $.trim($("#username-bennder").val());
        if(u === ""){
            ModalBennder.mostrar({tipo: "advertencia", mensaje: "Favor completar usuario.", titulo: "Recuperación contraseña"});
            return false;
        }
        ModalLoading.mostrar();
        $.ajax({
            url: 'requestPassword.html',
            type: 'POST',
            dataType: 'JSON',
            data: {u:u},
            success: function (data) {
                ModalLoading.cerrar();
                if (data.validacion.codigo === '0') {
                    ModalBennder.mostrar({tipo: "informativo", mensaje: data.validacion.mensaje, titulo: "Recuperación contraseña"});
                } else {
                    ModalBennder.mostrar({tipo: "advertencia", mensaje: data.validacion.mensaje, titulo: "Recuperación contraseña"});
                }
            },
            error: function (x, y, z) {
                ModalLoading.cerrar();
                ModalBennder.mostrar({tipo: "error", mensaje: "Problemas al enviar correo para recuperar contraseña", titulo: "Recuperación contraseña"});
            }
        });       
    },
    validacion:function(){
        if($.trim($("#user-login").val()) === ""){
            return {mensaje:"Favor completar usuario",isValid : false};
        }
        if($.trim($("#password").val()) === ""){
            return {mensaje:"Favor completar contraseña",isValid : false};
        }
        return {mensaje:"OK",isValid : true};
    },
    login: function () {
        var val = this.validacion();
        if(!val.isValid){
            ModalBennder.mostrar({tipo: "advertencia", mensaje: val.mensaje, titulo: "Validación"});
            return false;
        }
        ModalLoading.mostrar();
        $.ajax({
            url: 'login.html',
            type: 'POST',
            dataType: 'JSON',
            data: $("#form-login").serialize(),
            success: function (data) {
                if (data.validacion.codigo === '0') {
                    window.location.href = data.goToUrl;
                } else {
                    ModalBennder.mostrar({tipo: "advertencia", mensaje: data.validacion.mensaje, titulo: "Login"});
                }
                ModalLoading.cerrar();
            },
            error: function (x, y, z) {
                ModalLoading.cerrar();
                ModalBennder.mostrar({tipo: "error", mensaje: "Problemas al validar usuario", titulo: "Login"});
            }
        });
    }
};



