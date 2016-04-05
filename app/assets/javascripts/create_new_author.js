
$(document).ready(function() {
	$('.createAction').click(function() {
		if (confirm("Добавить нового автора в базу?")) {
			var author = {author: { name: 'Pelevin', country: 'RU', years:'2002-2007', note:'22222222'} };
			$.ajax({
				url: '/authors.json',
				type: 'POST',
				data: author,
				success: function(data){ console.log(data) }
			});
		};
	});
});