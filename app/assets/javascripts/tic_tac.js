$(document).on('turbolinks:load', function() {
    $(".square").on('click', function(e) {
            e.preventDefault();
            parent = $(this);
            input = parent.find('.move');
            victory = parent.find('[name="victory"]');
            console.log(victory);
            if(victory.length == 0) {
                $.post({
                    url: "/move",
                    data: {value: input.attr('value')},
                    success: function (html) {
                        parent.append(html);
                        parent.toggleClass('so_late square');
                        victory = parent.find('[name="victory"]')
                        if (victory.attr('value')){
                            alert('victory');
                        }
                    }
                });
            }
    });
});