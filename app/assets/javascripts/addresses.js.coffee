 # addresses.js.coffee
    jQuery ->
      # Create an address
      $(".address-form")
        .on "ajax:success", (evt, data, status, xhr) ->
          $(xhr.responseText).hide().insertBefore($(this)).show('slow')

    # Delete a comment
      $(document)
        .on "ajax:beforeSend", ".comment", ->
          $(this).fadeTo('fast', 0.5)
        .on "ajax:success", ".comment", ->
          $(this).hide('fast')
        .on "ajax:error", ".comment", ->
          $(this).fadeTo('fast', 1)          