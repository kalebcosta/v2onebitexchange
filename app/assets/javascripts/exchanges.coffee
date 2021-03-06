$(document).ready ->

  $('#amount').on 'keypress', (e) ->

    if(e.which == 13)  
      e.preventDefault()

      if $('#exchange_form').attr('action') == '/convert'
        $.ajax '/convert',
            type: 'GET'
            dataType: 'json'
            data: {
                    source_currency: $("#source_currency").val(),
                    target_currency: $("#target_currency").val(),
                    amount: $("#amount").val()
                  }
            error: (jqXHR, textStatus, errorThrown) ->
              alert errorThrown
            success: (data, text, jqXHR) ->
              $('#result').val(data.value.toFixed(2))
          return false;
    