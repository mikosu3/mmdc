$(function() {
	$('#check_all').on('change', function() {
		$('input[name^=ids]').prop('checked', this.checked);
	});
});
