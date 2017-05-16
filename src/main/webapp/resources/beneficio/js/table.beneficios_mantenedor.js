
/*
 * Editor client script for DB table beneficios_mantenedor
 * Created by http://editor.datatables.net/generator
 */

(function($){

$(document).ready(function() {
	var editor = new $.fn.dataTable.Editor( {
		ajax: 'php/table.beneficios_mantenedor.php',
		table: '#beneficios_mantenedor',
		fields: [
			{
				"label": "Nombre Promoci&oacute;n:",
				"name": "nombre_promocin"
			},
			{
				"label": "Categoria:",
				"name": "categoria",
				"type": "select",
				"options": [
					"Categoria Uno",
					" Categoria Dos",
					" Categoria Tres"
				]
			},
			{
				"label": "Fecha Inicio:",
				"name": "fecha_inicio",
				"type": "datetime",
				"format": "DD\/MM\/YY"
			},
			{
				"label": "Fecha Expiraci&oacute;n:",
				"name": "fecha_expiracin",
				"type": "datetime",
				"format": "DD-MM-YY"
			},
			{
				"label": "Estado de Publicaci&oacute;n:",
				"name": "estado_de_publicacin",
				"type": "select",
				"options": [
					"Activo",
					" Inactivo"
				]
			}
		]
	} );

	var table = $('#beneficios_mantenedor').DataTable( {
		dom: 'Bfrtip',
		ajax: 'php/table.beneficios_mantenedor.php',
		columns: [
			{
				"data": "nombre_promocin"
			},
			{
				"data": "categoria"
			},
			{
				"data": "fecha_inicio"
			},
			{
				"data": "fecha_expiracin"
			},
			{
				"data": "estado_de_publicacin"
			}
		],
		select: true,
		lengthChange: false,
		buttons: [
			{ extend: 'create', editor: editor },
			{ extend: 'edit',   editor: editor },
			{ extend: 'remove', editor: editor }
		]
	} );
} );

}(jQuery));

