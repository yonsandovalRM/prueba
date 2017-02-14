
$('#compilar').click(function() {

	$('#resultados').html('');
	var $asientos = 0;
	
	$("input:checkbox").each(function() {
		
		if ($(this).is(':checked')) {
			$name = $(this).val();
			$type = 'Asiento';
			$room_id = '#{@room.id}';
			$asientos = $asientos + 1;
		}
		else
		{
			$name = $(this).val();
			$type = 'Pasillo';
			$room_id = '#{@room.id}';
		}
		
		$('#resultados').append('<input type="hidden" class="form-control" name="seat[name[]]" value="'+$name+' " disabled/>');
		$('#resultados').append('<input type="hidden" class="form-control" name="seat[type[]]" value="'+$type+' " disabled/>');
		$('#resultados').append('<input type="hidden" class="form-control" name="seat[room_id[]]" value="'+$room_id+' " disabled/>');
		$('#resultados').append('<%= j (render :partial => "form", :locals => {:name => '+$name+'}  %>');

	});
	$('#resultados').append('<input type="submit" class="btn btn-success" value="Guardar '+$asientos+' asientos"/>');
});