jQuery(document).on('ready', function () {
    
    
    
});

var Sucursal = {
    onChangeRegion:function(){
        var idRegion = $("#select-region").val();
        if(idRegion!=='-1'){
            $.ajax({
                url: context+'/sucursal/getComunaByIdReg.html',
                type: 'GET',
                dataType: 'JSON',
                data: {idRegion:idRegion},
                success: function (array) {
                    if(array !==undefined && array !== null){
                        $("#select-comunas option").remove();
                        $("#select-comunas").append("<option value ='-1'>--Seleccione Comuna--</option>");
                        for(var i= 0;i < array.length;i++){
                           var c = array[i];
                           $("#select-comunas").append("<option value ='"+c.idComuna+"'>"+c.nombre+"</option>");
                        } 
                    }
                },
                error: function (x, y, z) {
                    ModalBennder.mostrar({tipo: "error", mensaje: "Error al cargar comunas", titulo: "Comuna Sucursal"});
                }
            }); 
        }
        else{
            ModalBennder.mostrar({tipo: "advertencia", mensaje: "Favor seleccionar región.", titulo: "Región Sucursal"});
        }
    },
    onValidaGuardaSucursal:function(){
        
    }
};

